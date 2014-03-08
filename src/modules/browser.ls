/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */

if !ls? then ls = ""

define [ls+"src/contents"], (contents) ->

  data-loaded = (cjs, path, data) -->
    # user-callback wants to load.. so load the keyword!
    load = load-keyword cjs

    # pop in the view
    tmp-engine = cjs[cjs.browser.templateEngine]
    tmp-engine.show-content data, load

  # loads the keyword specified in the path
  load-keyword = (cjs, keyword) -->
    loaded = data-loaded cjs
    contents.load-keyword cjs, keyword, loaded

  hash-load-keyword = (cjs, dummy) -->
    console.log dummy
    keyword = location.hash.substring 1
    load-keyword cjs, keyword

  {
    initialize: (cjs) -> {
      display-package: (data) ->
        console.log "if it would work the browser should display something ;)"
        tmp-engine = cjs[cjs.browser.templateEngine]
        tmp-engine.set-title data.Title

        hash-load = hash-load-keyword cjs

        console.log ($ window).bind
        ($ window).bind "hashchange", hash-load

        location.hash = "\#"+data.Initial
        ($ window).trigger "hashchange", data.Initial
    }
  }