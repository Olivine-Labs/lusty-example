local users = {
  { id = 1, name = "Jack" },
  { id = 2, name = "Drew" }
}

context.template = {
  type = "mustache",
  name = "app/templates/layout",

  partials = {
    content = "app/templates/users/profile",
  }
}

context.output = {
  user = users[tonumber(userId)],
  id = userId
}

context.response.status = 200
