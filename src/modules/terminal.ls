/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */

contents = require \../contents

data-loaded = (cjs, path, data) -->
  # user-callback wants to load.. so load the keyword!
  load = load-keyword cjs

  # pop in the view
  cjs.terminal.show-content data, load

# loads the keyword specified in the path
load-keyword = (cjs, keyword) -->
  loaded = data-loaded cjs
  contents.load-keyword cjs, keyword, loaded

module.exports := {
  initialize: (cjs) ->
    {
      display: (...) ->
        if !cjs.terminal.show-content?
          throw "Displaying in Terminal requires a 'terminal.show-content' to be set."
        load-keyword cjs, cjs.package.Initial
    }
}
