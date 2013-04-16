local lustache = require "lustache"

function readAll(file)
  local f = io.open(file, "rb")
  local content = f:read("*all")
  f:close()
  return content
end

local template = readAll("./templates/layout.mustache")
local page = readAll("./templates/page.mustache")

context.output = "I am literally drew ditthardt"
context.response.status = 200

