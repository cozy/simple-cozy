home = require 'cozy-home'
dataSystem = require 'cozy-data-system'
proxy = require 'cozy-proxy'
contacts = require 'cozy-contacts'


main = (opts, callback) ->
    startStack ->
        contacts {}, ->
            callback()
            setInterval ->
                console.log process.memoryUsage()
            , 2000

startStack = (callback) ->
    dataSystem ->
        home ->
            proxy callback

module.exports = main

main() if not module.parent
