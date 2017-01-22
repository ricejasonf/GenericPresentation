fs = require 'fs'
crypto = require 'crypto'
{ exec } = require 'child_process'
jsdom = require 'jsdom'
Promise = require 'bluebird'


readFile = (filepath, optional = false) -> ->
  new Promise (resolve, reject) ->
    fs.readFile filepath, 'utf8', (err, data) ->
      reject err if err && !optional
      if err
        data = ''
      resolve data

module.exports = (content) ->
  @cacheable()
  next = @async()
  base_path = @resourcePath
  cpp_html = base_path + '.html'
  cpp_output = base_path + '.output'
  result = ''
  readFile(cpp_html)()
  .then (html) ->
    result += html
    return null
  .then(readFile(cpp_output, 'optional'))
  .then (output_content) ->
    if output_content.length
      result += "<pre class=\"program-output\" >#{output_content}</pre>"
    return null
  .then ->
    next null, result
  .catch (err) =>
    @emitError "Syntaxify went horribly wrong."
    next err
