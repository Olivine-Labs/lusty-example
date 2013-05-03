-- For this example, we'll load up a mustache template and populate it with
-- some partials and some data.
--
-- If this is a json request, `context.output` will be the json output.
--
-- We'll also set the status to 500 and call the logger, since this is an error
-- page.

context.log("Page not found: "..context.request.url, "error")

context.template = {
  type = "mustache",
  name = "app/templates/layout",

  partials = {
    content = "app/templates/error",
  }
}

context.output = {
  message = "Page not found.",
  code = 500
}

context.response.status = 500

