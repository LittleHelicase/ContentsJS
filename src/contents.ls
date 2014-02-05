/*
 * ContentJS
 * https://github.com/LittleHelicase/ContentsJS?source=c
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
path = require \path

get-base-filename = (contents-location) ->
  path.join contents-location, "contents.json"

module.exports = {
  load-contents: (contents-location, json-loader, loaded) ->
    base-filename = get-base-filename contents-location
    json-loader "#base-filename", (data) ->
      content-object = {
        loader: json-loader

        main-file: {
          name: base-filename,
          content: data
        }

        initial-file: (...) ->
          data.Initial

        load-content: (name, func) !->
          file-name = path.join contents-location, name
          json-loader file-name, func
          
      }
      loaded content-object
}
