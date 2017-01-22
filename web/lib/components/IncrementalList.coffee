{
  addons: {
    cloneWithProps
  }
  DOM: {
    ul
    div
  }
} = require 'react'
ReactComponent = require '../ReactComponent.coffee'

module.exports = ReactComponent
  render: ->
    if Array.isArray(@props.children)
      ul @props,
        (for child, i in @props.children
          div
            className: [
              'visible'
              'invisible' unless i < @props.step
            ].join ' '
            child
        )...
    else
      ul @props,
        @props.children
