
global <<< require \prelude-ls
require! chai
chai.should!

cjs = require \../src/contents
preloaded-example = require \./fixtures/load-example

const path = "TEST"

describe "ContentsJS Core", (...) !->
  it "should create a correct initial path", (...)  !->
    entry = cjs.initialize path
    entry.path.should.equal path
    # default value should be "contents"
    entry.entry.should.equal "contents"
    entry.file.should.equal "TEST/contents"

  it "should load files using the callback", (...) ->
    entry = cjs.initialize path
    loader = (filename) ->
      filename.should.equal "TEST/contents"
    cjs.load-content entry, loader

  it "should send callback loaded content with path", (...) ->
    entry = cjs.initialize "fixtures" "load-example"
    loader = (filename, loaded) ->
      # explicit local call necessary! ? nodejs path normalizes
      # the path and removes the ./ making the test fail without
      # explicit "localization" = "./"
      json-file = require "./#filename"
      loaded json-file

    cjs.load-content entry, loader, (path, data) ->
      path.should.deep.equal entry
      data.should.deep.equal preloaded-example
