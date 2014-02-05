
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

# dummy for currying (I couldn't find out how to curry the last parameter)
button-callback = (screen, box, content, keyword,dummy) -->
  if box.content != keyword then
    box.setContent keyword
  else
    box.setContent content.Content
  screen.render!

module.exports = {
  # TODO: wrap screen!
  initialize: (...) ->
    blessed.screen!
  show-content: (screen, content, user-callback) ->
    box = create-content-box content.Content
    title-box = create-title-box content.Title

    screen.append box
    screen.append title-box

    # add buttons to the side of the view
    v-pos = 1
    tree = tp.parse-markdown content.Content
    tp.keywords tree, (keyword, reference) ->
      btn = create-button keyword, (keyword.charAt 0), 1, v-pos
      v-pos := v-pos + 4
      screen.append btn

      # add callback for button
      keyword-button-callback = button-callback screen, box, content, keyword
      screen.key (keyword.charAt 0), keyword-button-callback
    
    quit = create-button "Quit", "q / ESC", "75%", "90%"
    screen.append quit

#    console.dir box.content
#    process.exit 0

    screen.key ['escape', 'q', 'C-c'], (ch, key) ->
      process.exit 0

    screen.render!

}