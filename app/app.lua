-- setup the path so we load files from the local directory
-- also load from the lusty package (will go away once lusty is a luarock)
package.path = './?.lua;./app/lusty/src/?.lua;'..package.path

-- load lusty from the directory (will switch to luarock)
local lusty = require 'lusty'()

--since we'll be using nginx bindings, add the nginx wrapper
lusty = require 'lusty-nginx'(lusty)

--since we're opting to configure lusty using a table, bring in and use lusty-config
local configure = require 'lusty-config'

local config = {
  subscribers = {
    input = {
      -- decode json input if it exists in the body data
      { ['lusty-json.input.json'] = { json = require 'cjson' } }
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

    render = {
      { ['lusty-mustache.render.mustache'] = {} }
    },

    output = {
      -- capture html requests as mustache handlers
      { ['lusty-html.output.html'] = { } },

      -- capture json requests to output handler data as json
      { ['lusty-json.output.json'] = { json = require 'cjson' } }
    },

    log = {
      -- log events should write to the console
      { ['lusty-log-console.log.console'] = {} },

      -- log events should also go up to nginx
      { ['lusty-nginx.log'] = {} },
    }
  },

  -- as requests come in, fire these events in order (corresponding to
  -- subscribers above)
  publishers = {
    {"input"},
    {"request"},
    {"render"},
    {"output"}
  },

  -- bind context methods to the context object that is passed around, so you
  -- can use things like context.log and context.store from within your handler
  context = {
    ['lusty-log.context.log'] = { level = "debug" }
  }
}

configure(lusty, config)

-- return the lusty object
return lusty
