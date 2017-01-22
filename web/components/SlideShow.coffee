SlideShow = require '../lib/components/SlideShow.coffee'
MultiStep = require '../lib/components/MultiStepSlide.coffee'
SyntaxSlide = require '../lib/components/SyntaxSlide.coffee'

MainTitle = require './MainTitle.coffee'
###
VariadicTemplates1 = SyntaxSlide
  title: 'Variadic Templates'
  syntax: require '../cpp/VariadicTemplates1.cpp'
###

module.exports = SlideShow
  slides: [
    (MultiStep MainTitle, [1..2])...
    (MultiStep WhatIsTmp, [0..2])...
    VariadicTemplates1
    (MultiStep HanaTitle, [1..2])...
  ]
