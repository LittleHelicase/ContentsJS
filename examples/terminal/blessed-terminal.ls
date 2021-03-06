/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */


requirejs = require \../../src/require

contentsjs = requirejs \ls!src/contents
view = requirejs \ls!src/view/node/terminal-view
global <<< require \prelude-ls

# assume third argument is the directory to load
dir-to-load = process.argv[2]

if !dir-to-load? then
  console.log "missing argument, path to contents required"
  process.exit 1

screen = view.initialize!
display = view.show-content screen

cjs = contentsjs.initialize {
  version: "0.0.1"
  load: "node-require"
  output: "terminal"
  path: dir-to-load
  modules: ["terminal"]
  terminal: {
    show-content: display
  }
}
cjs.terminal.display!