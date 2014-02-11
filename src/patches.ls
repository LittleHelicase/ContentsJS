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

# one file for only loading the patch seems a bit too much..
module.exports = {
  # loads a file specified by cjs-path with the specified loader
  # for the files and a callback when the file is loaded
  load-patch: (cjs, patch-path, loaded, preprocess) ->
    cjs.loader patch-path, (data) ->
      preprocess? data
      loaded patch-path, data
}
