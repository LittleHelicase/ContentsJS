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
    # the path determines where the contentsjs-package lies
    # and what is viewed. (One might extend it for histories
    # or multiple concurrent views!?)
    entry-path = {
      path: contents-location
      entry: entry-keyword
    }
    @keyword-path entry-path, entry-keyword

  # gets the path to the keyword file using the package-path
  # the function returns a new path with the current file
  # as the active path
  keyword-path: (cjs-path, keyword) ->
    path: cjs-path.path
    file: path.join cjs-path.path, keyword
    entry: cjs-path.entry

  # loads a file specified by cjs-path with the specified loader
  # for the files and a callback when the file is loaded
  load-content: (cjs-path, json-loader, loaded) ->
    module = this
    filename = cjs-path.file
    json-loader "#filename", (data) ->
      loaded cjs-path, data
}
