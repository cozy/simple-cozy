home = require 'cozy-home'
dataSystem = require 'cozy-data-system'
proxy = require 'cozy-proxy'
contacts = require 'cozy-contacts'

dataSystem ->
    home ->
        proxy ->
            contacts {}, ->
                setInterval ->
                    console.log process.memoryUsage()
                , 2000


