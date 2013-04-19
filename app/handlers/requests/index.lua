-- For this example, we'll load up a mustache template and populate it with
-- some partials and some data.
--
-- If this is a json request, `context.output` will be the json output.
return {
  handler = function(context)
    context.template = {
      type = "mustache",
      name = "app/templates/layout",

      partials = {
        content = "app/templates/index",
      }
    }

    context.output = {
      result = "IT WORKS!"
    }

    context.response.status = 200
  end
}

