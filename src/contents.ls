/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */


patches = require \./patches
loader = require \./loader
require! path

const emptyFile = {Content: ""}

module-load = (cjs, exported) -->
  exported.initialize cjs

data-loaded = (path, data) ->
  # user-callback wants to load.. so load the keyword!
  request-load = (keyword) ->
    load-path patches.keyword-path path, keyword

  # pop in the view
  display data, request-load

# loads the keyword specified in the path
load-path = (path) ->
  patches.load-content path, json-loader, data-loaded
  
load-initial-package = (cjs, loaded) ->
  initial-package = path.join cjs.path, "contents"
  cjs.loader initial-package, loaded

module.exports = {
  initialize: (config) ->
    cjs = {}
    cjs <<< config
    cjs.load = if !config.load then "node-require"
    cjs.loader = switch cjs.load
    | "node-require"  => loader.node-loader!
    | "jquery"        => loader.jquery config.browser.jquery
    | otherwise       => loader.node-loader!

    m-load = module-load cjs
    config.modules |> map (module) ->
      cjs[module] <<< cjs.loader "./modules/#module", m-load, no # json file
    
    load-initial-package cjs, (content) ->
      cjs.package = content

    return cjs

  load-keyword: (cjs, keyword, loaded) ->
    keyword-path = path.join cjs.path, "patches", keyword
    patches.load-patch cjs, keyword-path, loaded

}