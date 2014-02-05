
global <<< require \prelude-ls
chai = require \chai
chai.should!

tp = require \../src/textprocessing
  
describe "Textprocessing", (...) !->
  it "should process keywords in markdown files", (...)  !->
    text-example = require "./fixtures/markdown"
    tree = tp.parse-markdown text-example.text
    tp.keywords tree, (keyword, ref) -> 
      ref.should.deep.equal text-example.keywords[keyword]
