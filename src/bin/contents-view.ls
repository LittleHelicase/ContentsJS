/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */


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
  try
    json-file = require "../../#file"
    fun json-file
  catch
    fun {Content: ""}


screen = view.initialize!
display = view.show-content screen

cjs = contentsjs.initialize{
  load: "node-require",
  output: "terminal",
  path: dir-to-load,
  modules: ["terminal"]
  terminal: {
    display: display
  }
}
cjs.display!
contentjs.run dir-to-load, json-loader, display

data-loaded = (path, data) ->
  # user-callback wants to load.. so load the keyword!
  load = (keyword) ->
    load-path contentsjs.keyword-path path, keyword

  # pop in the view
  view.show-content screen, data, load

# loads the keyword specified in the path
load-path = (path) ->
  contentsjs.load-content path, json-loader, data-loaded

entry = contentsjs.initialize dir-to-load

contentsjs.load-content entry, json-loader, (path, data) ->
  # The initial file contains the starting keyword!
  initial-keyword = data.Initial
  
  initial-path = contentsjs.keyword-path path, initial-keyword

  load-path initial-path, initial-keyword
