
blessed = require \blessed

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

create-button = (title, key, left-pos) ->
  blessed.button {
    left: left-pos
    top: "90%"
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

module.exports = {
  initialize: (...) ->
    blessed.screen!
  show-content: (screen, content, user-callback) ->
    box = create-content-box content.Content
    title-box = create-title-box content.Title

    btn = create-button "BUTTON", "b", 1
    quit = create-button "Quit", "q / ESC", "75%"

    screen.append box
    screen.append title-box
    screen.append btn
    screen.append quit

#    console.dir box.content
#    process.exit 0

    screen.key 'b', (...) ->
      if box.content != "BUTTON!" then
        box.setContent "BUTTON!"
      else
        box.setContent content.Content
      screen.render!

    screen.key ['escape', 'q', 'C-c'], (ch, key) ->
      process.exit 0

    screen.render!

}