package.path = './?.lua;./app/lusty/src/?.lua;'..package.path

local Lusty = require 'init'

local config = {
    server = require 'server.nginx',

    subscribers = {
      input = {
        { ['event.input.json'] = { json = require 'cjson' } }
      },

      request = {
        { ['event.request.file'] = { file = 'handlers.root' } },

        drew = {{ ['event.request.file'] = { file = 'handlers.drew' } }}
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
