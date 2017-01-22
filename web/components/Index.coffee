{
  ReactComponent
  DOM: {
    h3
    div
    ul
    li
  }
} = require '../lib/deps.coffee'
CppTmpSlideShow = require './CppTmpSlideShow.coffee'

frame = 0
scroll_pos = 0

clearScroll = ->
  window.setTimeout ->
    window.scrollTo(0, 0)
    scroll_pos = 0
  , 50

initKeyboard = (update) ->
  window.document.onkeydown = (e) ->
    if (e.keyCode is 39)
      clearScroll()
      frame++
    else if (e.keyCode is 37)
      clearScroll()
      frame--
    update()

#todo i might eliminate scroll in favor of absolute positioning
#this would get rid of the scroll bar
initScroll = (update) ->
  window.scrollTo(0,0)
  doc = window.document
  doc.onscroll = (e) ->
    window.setTimeout ->
      max = Math.max(
        doc.body.scrollHeight
        doc.body.offsetHeight
        doc.documentElement.clientHeight
        doc.documentElement.scrollHeight
        doc.documentElement.offsetHeight
      ) - window.innerHeight
      s = if doc.documentElement.scrollTop? then doc.documentElement.scrollTop else doc.body.scrollTop
      scroll_pos = if max > 0 then Math.floor(s / max * 100) else 0
      #update() #too slow
    , 50

module.exports = ReactComponent
  componentDidMount: ->
    update = => @forceUpdate()
    initKeyboard(update)
    #initScroll(update) # broken

  render: ->
    div
      className: 'index'
      div
        style:
          backgroundColor: 'black'
          position: 'fixed'
          zIndex: 1000
          fontSize:'0.5em'
        frame
        #" | "
        #"scroll: #{scroll_pos}%"
      div
        className: 'slide-container'
        CppTmpSlideShow
          frame: frame
