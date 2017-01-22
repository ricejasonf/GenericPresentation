merge = require 'merge'
{
  ReactFactory
} = require 'react'
{
  ReactComponent
  DOM: {
    div
  }
} = require '../deps.coffee'

module.exports = (options) -> ReactComponent
  displayName: options.displayName

  frame: ->
    frame = @props.frame
    len = options.slides.length
    if frame < 0
      frame = len + frame
    frame %= len
    frame

  slide: () ->
    slide = options.slides[@frame()]
    if typeof slide is 'function'
      slide @props
    else
      slide.element merge(slide.props, @props)

  render: ->
    @slide()
