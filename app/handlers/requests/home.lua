-- For this example, we'll load up a mustache template and populate it with
-- some partials and some data.
--
-- If this is a json request, `context.output` will be the json output.

context.template = "app/templates/layout.mustache"

context.partials = {
  content = "app/templates/index.mustache"
}

context.output = {
  result = "IT WORKS!"
}

context.response.status = 200

