-- setup the path so we load files from the local directory
package.path = './?.lua;'..package.path

-- load and create an instance of lusty
local lusty = require 'lusty'()

--load config table
local config = require 'config'

--since we're opting to configure lusty using a table,
--bring in and use lusty-config
local configure = require 'lusty-config'
configure(lusty, config)

--since we'll be using nginx bindings, add the nginx wrapper
local server = require 'lusty-nginx'
return server(lusty)
