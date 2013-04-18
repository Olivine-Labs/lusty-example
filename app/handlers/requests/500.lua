-- For this example, we'll load up a mustache template and populate it with
-- some partials and some data.
--
-- If this is a json request, `context.output` will be the json output.
--
-- We'll also set the status to 500 and call the logger, since this is an error
-- page.
return {
  handler = function(context)
    context.template = "app/templates/layout.mustache"

    context.partials = {
      content = "app/templates/error.mustache"
    }

    context.output = {
      message = "Server error.",
      code = 500
    }

    context.response.status = 500

    context.log("Server error on: "..context.request.url, "error")
  end
}
