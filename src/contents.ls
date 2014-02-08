/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */


patches = require \./patches

data-loaded = (path, data) ->
  # user-callback wants to load.. so load the keyword!
  request-load = (keyword) ->
    load-path patches.keyword-path path, keyword

  # pop in the view
  display data, request-load

# loads the keyword specified in the path
load-path = (path) ->
  patches.load-content path, json-loader, data-loaded

module.exports = {
	initialize: (config) ->


}