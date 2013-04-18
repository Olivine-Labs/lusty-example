-- setup the path so we load files from the local directory
-- also load from the lusty package (will go away once lusty is a luarock)
package.path = './?.lua;./app/lusty/src/?.lua;'..package.path

-- load lusty from the directory (will switch to luarock)
local Lusty = require 'app.lusty.src.init'

local config = {
  -- we'll be using nginx bindings for our example
  server = require 'server.nginx',

  subscribers = {
    input = {
      -- decode json input if it exists in the body data
      { ['event.input.json'] = { json = require 'cjson' } }
    },

    request = {
      -- / is routed to /index in nginx
      -- the ./handlers/index.lua file is loaded when /index is requested
      index = 'handlers.requests.index',

      -- 404 route and catch-all to redirect to 404
      -- the ./handlers/404.lua file is loaded when /404 is requested
      ["404"] = 'handlers.requests.404',
      ["500"] = 'handlers.requests.500',

      -- the ./handlers/404.lua file is loaded if the request didn't match any
      -- above routes (an entry with no key is a default, "root" handler)
      'handlers.requests.404'
    },

    output = {
      -- capture html requests as mustache handlers
      { ['output.mustache'] = { } },

      -- capture json requests to output handler data as json
      { ['event.output.json'] = { json = require 'cjson' } }
    },

    log = {
      -- log events should write to the console
      { 'event.log.console' },

      -- log events should also go up to nginx
      { 'handlers.loggers.nginx' },
    }
  },

  -- as requests come in, fire these events in order (corresponding to
  -- subscribers above)
  publishers = {
    {"input"},
    {"request"},
    {"output"}
  },

  -- bind context methods to the context object that is passed around, so you
  -- can use things like context.log and context.store from within your handler
  context = {
    ['context.log'] = { level = "debug" },
    ['context.store'] = {}
  }
}

-- build a new lusty instance
lusty = Lusty(config)

-- return the lusty object
return lusty
