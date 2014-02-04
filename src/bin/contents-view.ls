
contentsjs = require \../contents
view = require \../view/node/terminal-view

# assume third argument is the directory to load
dir-to-load = process.argv[2]

if !dir-to-load? then
  console.log "missing argument, path to contents required"
  process.exit 1


# in node json files can be loaded via require
json-loader = (file, fun) ->
  json-file = require "../../#file"
  fun json-file


contentsjs.load-contents dir-to-load, json-loader, (data) ->
  console.log data
  console.log data.initial-file!
  data.load-content data.initial-file!, (initial-content) ->
    console.log initial-content