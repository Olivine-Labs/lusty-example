-- For this example, we'll load up a mustache template and populate it with
-- some partials and some data.
--
-- If this is a json request, `context.output` will be the json output.
--
-- We'll also set the status to 404 and call the logger, since this is an error
-- page.
return {
  handler = function(context)
    context.template = {
      type = "mustache",
      name = "app/templates/layout",

      partials = {
        content = "app/templates/error",
      }
    }

    context.output = {
      message = "Page not found.",
      code = 400
    }

    context.response.status = 404

    context.log("Page not found: "..context.request.url, "warning")
  end
}
