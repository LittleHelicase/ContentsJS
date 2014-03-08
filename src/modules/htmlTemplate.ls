/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */

if !ls? then ls = ""

define [ls+"src/textprocessing"] (tp) ->
  set-subtitle = (subtitle) ->
    subtitle-tag = $ "\#subtitle"
    subtitle-tag.text subtitle
  set-content = (content) ->
    content-tag = $ "\#content"
    content-tag.html tp.markdown-to-html content

  {
    initialize: (cjs) -> {
      set-title: (title) ->
        title-tag = $ "\#title"
        title-tag.text title
      show-content: (json) ->
        set-subtitle json.Title
        set-content json.Content
        console.log "if it would work the browser should use the html template ;)"
    }
  }