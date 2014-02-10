/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
path = require \path

const entry-keyword = "contents"

module.exports = {
  initialize: (contents-location, keyword=entry-keyword) ->
    # the path determines where the contentsjs-package lies
    # and what is viewed. (One might extend it for histories
    # or multiple concurrent views!?)
    entry-path = {
      path: contents-location
      entry: keyword
    }
    @patch-path entry-path, keyword

  # gets the path to the keyword file using the package-path
  # the function returns a new path with the current file
  # as the active path
  patch-path: (cjs-path, patchname) ->
    path.join cjs-path.path, patchname

  # loads a file specified by cjs-path with the specified loader
  # for the files and a callback when the file is loaded
  load-patch: (cjs, patch-path, loaded, preprocess) ->
    cjs.loader patch-path, (data) ->
      preprocess? data
      loaded patch-path, data
}
