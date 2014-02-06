/*
 * ContentJS
 * https://github.com/LittleHelicase/ContentsJS?source=c
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
path = require \path

const entry-keyword = "contents"

module.exports = {
  initialize: (contents-location) ->
    entry-path = {
      path: contents-location
      entry: entry-keyword
    }
    @keyword-path entry-path, entry-keyword

  # gets the path to the keyword file using the package-path
  keyword-path: (cjs-path, keyword) ->
    path: cjs-path.path
    file: path.join cjs-path.path, keyword
    entry: cjs-path.entry

  load-contents: (cjs-path, json-loader, loaded) ->
    module = this
    filename = cjs-path.file
    json-loader "#filename", (data) ->
      content-object = {
        loader: json-loader

        main-file: {
          name: filename,
          content: data
        }

        initial-file: (...) ->
          data.Initial

        load-content: (keyword, func) !->
          new-path = module.keyword-path cjs-path, keyword
          module.load-contents new-path, json-loader, func
          
      }
      loaded content-object
}
