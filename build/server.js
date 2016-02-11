// Generated by CoffeeScript 1.10.0
var contacts, dataSystem, home, main, proxy, startStack;

home = require('cozy-home');

dataSystem = require('cozy-data-system');

proxy = require('cozy-proxy');

contacts = require('cozy-contacts');

main = function(opts, callback) {
  return startStack(function() {
    return contacts({}, function() {
      callback();
      return setInterval(function() {
        return console.log(process.memoryUsage());
      }, 2000);
    });
  });
};

startStack = function(callback) {
  return dataSystem(function() {
    return home(function() {
      return proxy(callback);
    });
  });
};

module.exports = main;

if (!module.parent) {
  main();
}
