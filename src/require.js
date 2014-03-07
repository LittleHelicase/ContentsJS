
requirejs = require("../node_modules/.bin/r.js");

requirejs.config({
  nodeRequire: require,
  paths: {
  	'text': "../../lib/text",
  	'json': "../../lib/json",
    'src': "../../src",
    'modules': "../../src/modules",
    'livescript': "../../lib/livescript",
    'ls': "../../lib/ls",
    'prelude': "../../lib/prelude-browser",
  }
});

module.exports = requirejs;