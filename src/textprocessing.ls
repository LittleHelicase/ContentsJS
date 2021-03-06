/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */

define ["markdown"], (markdown) ->

  # taken from markdown README.md
  find-link-refs = ( refs, keyword-callback, jsonml) -->
    # keywords are references to their respective page
    if jsonml.0 == "link_ref" then
      ref = jsonml.1.ref

      # if there is no reference set special reference: #noref
      # TODO: one could probably define a global reference map for all patches to avoid redundancy
      if refs[ ref ]? then
        keyword-callback ref, refs[ref]
      else 
        keyword-callback ref, "\#noref"
    else if Array.isArray jsonml.1 then
      jsonml.1 |> map (find-link-refs refs, keyword-callback)
    else if Array.isArray jsonml.2 then
      jsonml.2 |> map (find-link-refs refs, keyword-callback)

  {
    parse-markdown: (text) ->
      markdown.parse text

    keywords: (tree, keyword-callback) ->
      if tree?.1?
        find-link-refs tree.1.references, keyword-callback, tree

    markdown-to-html: (text) ->
      tree = markdown.parse text
      html-tree = markdown.toHTMLTree tree
      markdown.renderJsonML html-tree
  }
