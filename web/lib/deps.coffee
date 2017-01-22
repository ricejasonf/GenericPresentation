#single file to export common lib dependencies
React = require 'react'
require 'react/addons'
ReactComponent = require './ReactComponent.coffee'
Syntax = require './components/Syntax.coffee'
SyntaxSlide = require './components/SyntaxSlide.coffee'
IncrementalList = require './components/IncrementalList.coffee'

module.exports =
  ReactComponent: ReactComponent
  Syntax: Syntax
  SyntaxSlide: SyntaxSlide
  IncrementalList: IncrementalList
  DOM: React.DOM
  div: React.DOM.div
  span: React.DOM.span
  h1: React.DOM.h1
  h2: React.DOM.h2
  h3: React.DOM.h3
  p: React.DOM.p
