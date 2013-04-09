package.path = './app/lusty/src/?.lua;'..package.path

local Lusty = require 'init'

local config = {
    server = require 'server.nginx',
    subscribers = {
      input = { 'event.input.json' },
      request = {
        { ['event.request.file'] = { file = 'handlers.root' } }
      },
      output = { 'event.output.json' },
      log = { 'event.log.console' }
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
