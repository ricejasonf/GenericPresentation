{
  ReactComponent
  DOM: {
    div
  }
} = require '../deps.coffee'

module.exports = (element, steps) ->
  (for step in steps
    element: element
    props: step: step
  )
