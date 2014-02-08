
global <<< require \prelude-ls
require! chai
chai.should!

patches = require \../src/patches
preloaded-example = require \./fixtures/load-example

const path = "TEST"

describe "Patches", (...) !->
  it "should load files using the callback", (...) ->
    entry = patches.initialize path
    loader = (filename) ->
      filename.should.equal "TEST/contents"
    patches.load-patch entry, loader

  it "should send callback loaded content with path", (...) ->
    entry = patches.initialize "fixtures" "load-example"
    loader = (filename, loaded) ->
      # explicit local call necessary! ? nodejs path normalizes
      # the path and removes the ./ making the test fail without
      # explicit "localization" = "./"
      json-file = require "./#filename"
      loaded json-file

    patches.load-patch entry, loader, (path, data) ->
      path.should.deep.equal entry
      data.should.deep.equal preloaded-example
