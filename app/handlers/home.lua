local lustache = require "lustache"

function readAll(file)
  local f = io.open(file, "rb")
  local content = f:read("*all")
  f:close()
  return content
end

local template = readAll("app/templates/layout.mustache")
local page = readAll("app/templates/index.mustache")
local content = lustache:render(template, {}, { content = page })

context.output = content
context.response.status = 200

