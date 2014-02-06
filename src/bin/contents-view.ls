
contentsjs = require \../contents
view = require \../view/node/terminal-view
global <<< require \prelude-ls

# assume third argument is the directory to load
dir-to-load = process.argv[2]

if !dir-to-load? then
  console.log "missing argument, path to contents required"
  process.exit 1


# in node json files can be loaded via require
json-loader = (file, fun) ->
  json-file = require "../../#file"
  fun json-file


screen = view.initialize!

data-loaded = (data) ->
  # curry data into the load function
  load = load-keyword-text data
  view.show-content screen, data.main-file.content, load

load-keyword-text = (data, keyword) -->
  data.load-content keyword, data-loaded

entry = contentsjs.initialize dir-to-load

contentsjs.load-contents entry, json-loader, (data) ->
  load-keyword-text data, data.initial-file!