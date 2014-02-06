
blessed = require \blessed
tp = require \../../textprocessing

create-content-box = (text) ->
  blessed.box {
    top: 'center'
    left: 'center'
    width: "70%"
    height: "70%"
    content: text
    style: {
      hover: {
        bg: "green"
      }
    }
  }

create-title-box = (title) ->
  blessed.box {
    top: '10%'
    left:'20%'
    height: 1
    content: "{bold}"+title+"{/bold}"
    tags: true
  }

create-button = (title, key, left-pos, top-pos) ->
  blessed.button {
    left: left-pos
    top: top-pos
    name: title
    content: title + "  {bold}[ " + key + " ]{/bold}"
    padding: {
      left: 1
      right: 1
      top: 1
      bottom: 1
    }
    tags: true
    shrink: true
    style: {
      bg: "blue"
    }
  }

initialize-screen = (term-view) ->
  screen = term-view.screen
  term-view.content-box = create-content-box "CONTENT"
  term-view.title-box = create-title-box "TITLE"

  screen.append term-view.content-box
  screen.append term-view.title-box
  
  term-view.quit-button = create-button "Quit", "q / ESC", "75%", "90%"
  screen.append term-view.quit-button

  screen.key ['escape', 'q', 'C-c'], (ch, key) ->
    process.exit 0

  term-view

# dummy for currying (I couldn't find out how to curry the last parameter)
button-callback = (screen, box, keyword,dummy) -->
  if box.content != keyword then
    box.setContent keyword
  screen.render!

module.exports = {
  # TODO: wrap screen!
  initialize: (...) ->
    tv = {
      screen: blessed.screen!
      buttons: []
      key-events: []
      current-path: "\#noref"
    }
    initialize-screen tv
  clear: (term-view) ->
    screen = term-view.screen
    term-view.buttons |> map (btn) ->
      screen.remove btn
    term-view.key-events |> map ({key, callback}) ->
      screen.unkey key, callback
  show-content: (term-view, content, user-callback) ->
    @clear term-view
    screen = term-view.screen
    term-view.content-box.setContent content.Content
    term-view.title-box.setContent content.Title
    
    # add buttons to the side of the view
    v-pos = 1
    tree = tp.parse-markdown content.Content
    tp.keywords tree, (keyword, reference) ->
      btn = create-button keyword, (keyword.charAt 0), 1, v-pos
      v-pos := v-pos + 4
      screen.append btn
      term-view.buttons.push btn

      # add callback for button
      keyword-button-callback = button-callback screen, term-view.content-box, keyword
      key = keyword.charAt 0
      screen.key key, keyword-button-callback
      term-view.key-events.push { key: key, callback: keyword-button-callback }
    
    screen.render!

}