context.template = "app/templates/layout.mustache"

context.partials = {
  content = "app/templates/404.mustache"
}

context.output = {
  message = "Page not found."
}

context.response.status = 404

