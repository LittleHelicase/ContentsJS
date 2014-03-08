/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */

define ["ls!src/patches", "ls!src/loader", "ls!src/versions"], (patches, loader, versions) ->
  

  const version = "0.0.1"
  const emptyFile = {Content: ""}

  module-load = (cjs, module-name, exported) -->
    cjs[module-name] <<< exported.initialize cjs
    
  load-initial-package = (cjs, loaded) ->
    initial-package = "#cjs.path/contents"
    cjs.loader initial-package, loaded

  {
    initialize: (config) ->
      # if the versions missmatch convert the data format (if possible)
      # this might come in handy if one wants to change the format
      # without lessen compatability (??)
      # if version is not set, it is assumed that the most recent version
      # is used (only interesting for development purposes)
      if version? and version != config.version
        config := versions.convert(config, config.version, version)

      cjs = {}
      cjs <<< config
      cjs.loader = loader.requirejs-loader!


      m-load = module-load cjs
      module-path = if cjs.module-path? then cjs.module-path else "./modules"
      config.modules |> map (module) ->
        this-m-load = m-load module
        cjs.loader "ls!modules/#module", this-m-load, no # json file
      
      load-initial-package cjs, (content) ->
        cjs.package = content

      return cjs

    load-keyword: (cjs, keyword, loaded) ->
      keyword-path = "#cjs.path/patches/#keyword"
      patches.load-patch cjs.loader, keyword-path, loaded

  }