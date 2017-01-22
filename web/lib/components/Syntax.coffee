ReactComponent = require '../ReactComponent.coffee'
{ div } = require('react').DOM

module.exports = ReactComponent
  render: ->
    div
      dangerouslySetInnerHTML:
        __html: @props.syntax
