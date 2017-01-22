// Generated by CoffeeScript 1.10.0
var Promise, createSyntaxFile, crypto, exec, fs, getSyntaxTag, jsdom, readFile;

fs = require('fs');

crypto = require('crypto');

exec = require('child_process').exec;

jsdom = require('jsdom');

Promise = require('bluebird');

createSyntaxFile = function(resource_file, content) {
  return new Promise(function(resolve, reject) {
    var cmd, filepath, sha;
    console.log('createSyntaxFile');
    sha = crypto.createHash('md5');
    sha.update(content);
    filepath = '/tmp' + sha.digest('hex') + '.html';
    cmd = "vim -E +'TOhtml' +'w " + filepath + "' +'q!' +'q!' -- " + resource_file + " > /dev/null";
    return exec(cmd, function(err, stdout, stderr) {
      console.log('here');
      if (err) {
        reject(err);
      }
      return resolve(filepath);
    });
  });
};

readFile = function(filepath) {
  return new Promise(function(resolve, reject) {
    console.log('readFile');
    return fs.readFile(filepath, 'utf8', function(err, data) {
      if (err) {
        console.log(err);
      }
      if (err) {
        reject(err);
      }
      return resolve(data);
    });
  });
};

getSyntaxTag = function(html) {
  return new Promise(function(resolve, reject) {
    console.log('getSyntaxTag');
    return jsdom.env({
      html: html,
      done: function(err, window) {
        var pre, temp;
        if (err) {
          console.log(err);
        }
        if (err) {
          reject(err);
        }
        pre = window.getElementById('#vimCodeElement');
        temp = window.document.createElement('div');
        temp.appendChild(pre);
        return resolve(temp.innerHTML);
      }
    });
  });
};

module.exports = function(content) {
  var next;
  next = this.async();
  return createSyntaxFile(content, this.resourcePath).then(readFile).then(getSyntaxTag).then(function(html) {
    return next(html);
  })["catch"]((function(_this) {
    return function(err) {
      _this.emitError("Vim ToHTML call failed.");
      return next(err);
    };
  })(this));
};
