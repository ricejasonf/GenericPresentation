{
  DOM: {
    h3
    div
  }
} = require 'react'
ReactComponent = require '../ReactComponent.coffee'
Syntax = require './Syntax.coffee'

module.exports = (options) -> ReactComponent
  render: ->
    div
      className: 'slide'
      h3
        className: 'title'
        options.title
      Syntax
        syntax: options.syntax
