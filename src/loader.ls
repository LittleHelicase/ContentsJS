/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */

const emptyFile = {Content: ""}

module.exports = {
  # in node json files can be loaded via require
  node-loader: (...) ->
    (file, callback, is-json=true) ->
      try
        loaded-file = require "#file"
        callback loaded-file
      catch error
        console.log "unable to load #file (#error)"
        callback emptyFile

  # in jquery json files are loaded differently than
  # normal sources (like modules)
  jquery-loader: ($) ->
    (file, callback, is-json=true) ->
      try
        if is-json
          $.getJSON file, callback
        else
          $.getScript file, callback
      catch error
        console.log "unable to load #file (#error)"
        callback emptyFile

}