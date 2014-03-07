
global <<< require \prelude-ls
require! chai
chai.should!

patches = requirejs \ls!src/patches
preloaded-example = require \./fixtures/load-example

const path = "TEST"

describe "Patches", (...) !->
  it "should load files using the callback", (...) ->
    entry = "TEST/contents"
    loader = (filename) ->
      filename.should.equal entry
    patches.load-patch loader, entry

  it "should send callback loaded content with path", (...) ->
    loader = (filename, loaded) ->
      # explicit local call necessary! ? nodejs path normalizes
      # the path and removes the ./ making the test fail without
      # explicit "localization" = "./"
      json-file = require "./#filename"
      loaded json-file

    entry = "fixtures/load-example"
    patches.load-patch loader, entry, (path, data) ->
      path.should.equal entry
      data.should.deep.equal preloaded-example
