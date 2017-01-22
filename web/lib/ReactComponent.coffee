React = require 'react'

module.exports = (spec) ->
	component = React.createClass spec
	React.createFactory component

