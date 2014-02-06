
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

data-loaded = (path, data) ->
  load = (keyword) ->
    load-keyword-text contentsjs.keyword-path path, keyword
  view.show-content screen, data, load

load-keyword-text = (path) ->
  contentsjs.load-content path, json-loader, data-loaded

entry = contentsjs.initialize dir-to-load

contentsjs.load-content entry, json-loader, (path, data) ->
  initial-path = contentsjs.keyword-path path, data.Initial
  load-keyword-text initial-path, data.Initial