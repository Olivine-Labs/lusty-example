package.path = './?.lua;./app/lusty/src/?.lua;'..package.path

local Lusty = require 'app.lusty.src.init'

local config = {
    server = require 'server.nginx',

    subscribers = {
      input = {
        { ['event.input.json'] = { json = require 'cjson' } }
      },

      request = {
        { ['event.request.file'] = { file = 'handlers.home' } }
      },

      output = {
        { ['event.output.html'] = { } },
        { ['event.output.json'] = { json = require 'cjson' } }
      },

      log = {
        { 'event.log.console' }
      }
    },

    publishers = {
      {"input"},
      {"request"},
      {"output"}
    },

    context = {
      'log',
      'store'
    }
  }

lusty = Lusty(config)
return lusty
