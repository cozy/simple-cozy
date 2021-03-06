home = require 'cozy-home'
dataSystem = require 'cozy-data-system'
proxy = require 'cozy-proxy'
contacts = require 'cozy-contacts'
emails = require 'cozy-emails'
files = require 'cozy-files'
calendar = require 'cozy-calendar'
gandi = require 'gandi'


main = (opts, callback) ->
    startPouchDB ->
        startStack ->
            contacts {}, ->
                emails {}, ->
                    files ->
                        calendar 9113, ->
                            gandi ->
                                callback?()
                                setInterval ->
                                    console.log process.memoryUsage()
                                , 2000

startStack = (callback) ->
    dataSystem ->
        home ->
            proxy host: '0.0.0.0', callback


startPouchDB = (callback) ->
    express = require('express')
    app     = express()
    PouchDB = require('pouchdb')
    app.use('/', require('express-pouchdb')(PouchDB))
    app.listen 5984, callback

#main = ->
    #path = require 'path'
    #spawn = require('child_process').spawn
    #dsPath = cwd: path.join __dirname, 'node_modules', 'cozy-data-system'
    #bat = spawn 'node',  ['build/server.js'],
        #cwd: dsPath

    #bat.stdout.on 'data', (data) =>
        #console.log(data)

    #bat.stderr.on 'data', (data) =>
        #console.log(data)

    #bat.on 'exit', (code) =>
        #console.log "Child exited with code #{code}"

    #setInterval ->
        #console.log process.memoryUsage()
    #, 2000


module.exports = main
main() if not module.parent

