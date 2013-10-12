context.template = {
  type = "mustache",
  name = "app/templates/layout",

  partials = {
    content = "app/templates/users",
  }
}

--context.statsd:increment("users.get", 1)

context.output = {
  users = {
    { id = 1, name = "Jack" },
    { id = 2, name = "Drew" }
  }
}

context.response.status = 200
