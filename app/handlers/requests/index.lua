-- For this example, we'll load up a mustache template and populate it with
-- some partials and some data.
--
-- If this is a json request, `context.output` will be the json output.

context.log("Page not found: "..context.request.url, "error")

context.template = {
  type = "mustache",
  name = "app/templates/layout",

  partials = {
    content = "app/templates/index",
  }
}

context.output = {
  result = "Hello from Lusty"
}

context.response.status = 200


