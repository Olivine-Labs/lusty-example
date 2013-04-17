local lustache = require "lustache"

local readAll = function(file, cache)
  local content = cache[file]

  if not content then
    local f = io.open(file, "rb")
    content = f:read("*all")
    f:close()
    cache[file] = content
  end

  return content
end

local cache = {}

return {
  handler = function(context)
    context.response.headers["content-type"] = "text/html"

    local partials = {}
    local template = readAll(context.template, cache)


    for i,v in pairs(context.partials) do
      partials[i] = readAll(v, cache)
    end

    local content = lustache:render(template, context.output, partials)

    context.response.send(content)
  end,

  options = {
    predicate = function(context)
      local accept = context.request.headers.accept or "text/html"
      local content = context.request.headers["content-type"]

      return (accept and (accept:find("text/html") or accept:find("*/*"))) or
             (content and content:find("text/html"))
    end
  }
}
