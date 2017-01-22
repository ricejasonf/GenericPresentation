fs = require 'fs'
crypto = require 'crypto'
{ exec } = require 'child_process'
jsdom = require 'jsdom'
Promise = require 'bluebird'

createSyntaxFile = (resource_file, content) ->
  new Promise (resolve, reject) ->
    console.log 'createSyntaxFile'
    sha = crypto.createHash('md5')
    sha.update(content)
    filepath = '/tmp' + sha.digest('hex') + '.html'
    cmd = "vim -E +'TOhtml' +'w #{filepath}' +'q!' +'q!' -- #{resource_file} > /dev/null"
    exec cmd, (err, stdout, stderr) ->
      console.log 'here'
      reject err if err
      resolve filepath

readFile = (filepath) ->
  new Promise (resolve, reject) ->
    console.log 'readFile'
    fs.readFile filepath, 'utf8', (err, data) ->
      console.log err if err
      reject err if err
      resolve data

getSyntaxTag = (html) ->
  new Promise (resolve, reject) ->
    console.log 'getSyntaxTag'
    jsdom.env
      html: html
      done: (err, window) ->
        console.log err if err
        reject err if err
        pre = window.getElementById('#vimCodeElement')
        temp = window.document.createElement 'div'
        temp.appendChild(pre)
        resolve temp.innerHTML

module.exports = (content) ->
  next = @async()
  createSyntaxFile(content, @resourcePath)
    .then(readFile)
    .then(getSyntaxTag)
    .then (html) ->
      next html
    .catch (err) =>
      @emitError "Vim ToHTML call failed."
      next err
