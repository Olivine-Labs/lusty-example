package.path = './app/lusty/src/?.lua;'..package.path

local Lusty = require 'init'

local config = {
  ["config.requests.root"] = {
    file = 'config.handlers.root'
  },
  log = {
    level = "debug"
  },
  lazy = false,
  server = 'nginx',
  subscribers = {
    input = {
      'event.input.json'
    },
    request = {
      {'event.request.file', 'config.requests.root'}
    },
    output = {
      'event.output.json'
    },
    log = {
      'event.log.console'
    }
  },
  publishers = {
    {"input"},
    {"prerequest"},
    {"request"},
    {"postrequest"},
    {"output"}
  },
  context = {
    'options',
    'log',
    'store'
  }
}

lusty = Lusty(config)
return lusty
