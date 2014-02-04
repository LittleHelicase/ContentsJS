
path = require \path
$ = require \jQuery

get-base-filename = (contents-location) ->
  path.join contents-location, "contents.json"

module.exports = {
  loadContents: (contents-location) ->
    base-filename = get-base-filename contents-location
    $.getJSON base-filename, (data) ->
      console.log data
    [contents-location, base-filename]
}
