/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */


define (...) ->
  const emptyFile = {Content: ""}

  {
    # in node json files can be loaded via require
    node-loader: (...) ->
      (file, callback, is-json=true) ->
        try
          loaded-file = require "#file"
          callback loaded-file
        catch error
          console.log "unable to load #file (#error)"
          callback emptyFile

    requirejs-loader: (...) ->
      (file, callback, is-json=true) ->
        try
          if is-json
            loaded-file = requirejs "json!#file.json"
            callback loaded-file
          else
            loaded-file = requirejs "#file"
            callback loaded-file
        catch error
          console.log "unable to load #file (#error)"
          callback emptyFile

    # in jquery json files are loaded differently than
    # normal sources (like modules)
    jquery-loader: ($) ->
      (file, callback, is-json=true) !->
        try
          if is-json
            $.getJSON "#file.json", callback
          else
            window.module := {};
            ($.getScript "#file.js")
              .done (...) ->
                console.log "data loaded"
                callback eval "module.exports;"
              .fail (...) ->
                console.log &2
        catch error
          console.log "unable to load #file (#error)"
          if is-json
            callback emptyFile
          else
            console.log "cannot continue without scriptfile"

  }