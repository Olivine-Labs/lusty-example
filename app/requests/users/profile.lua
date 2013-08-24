context.template = {
  type = "mustache",
  name = "app/templates/layout",

  partials = {
    content = "app/templates/users/profile",
  }
}

context.output = {
  result = "This might show a users' profile for user with id "..userId
}

context.response.status = 200
