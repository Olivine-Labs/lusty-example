package.path = './?.lua;./app/lusty/src/?.lua;'..package.path

local Lusty = require 'app.lusty.src.init'

local config = {
    server = require 'server.nginx',

    subscribers = {
      input = {
        { ['event.input.json'] = { json = require 'cjson' } }
      },

      request = {
        index = {{ ['event.request.file'] = { file = 'handlers.home' } }},
        { ['event.request.file'] = { file = 'handlers.404' }},
      },

      output = {
        { ['output.mustache'] = { } },
        { ['event.output.json'] = { json = require 'cjson' } }
      },

      log = {
        { 'event.log.console' }
      }
    },

    publishers = {
      {"log"},
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
