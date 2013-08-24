-- For this example, we'll load up a mustache template and populate it with
-- some partials and some data.
--
-- If this is a json request, `context.output` will be the json output.
--
-- We'll also set the status to 500 and call the logger, since this is an error
-- page.
context.log("Server Error: "..context.request.url, "error")

context.template = {
  type = "mustache",
  name = "app/templates/layout",

  partials = {
    content = "app/templates/error",
  }
}

context.output.error = {}

for _, error in pairs(context.error) do
  --Build stack trace
  local trace = {}
  local headerRemoved = false
  for line in error.trace:gmatch("[^\r\n]+") do
    if headerRemoved then
      line = line:gsub("^%s*", "")
      if string.sub(line, 1, 1) ~= '[' then
        trace[#trace+1]=line
      end
    else
      headerRemoved = true
    end
  end

  local message = error.message
  if type(message) == "table" then
    message = message[1]
  end

  context.output.error[#context.output.error+1] = {
    message = message,
    trace = trace,
  }
end

context.output.code = context.response.status
