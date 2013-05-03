context.template = {
  type = "mustache",
  name = "app/templates/layout",

  partials = {
    content = "app/templates/users",
  }
}

if userId == '' then
  context.output = {
    result = "This might show a list of users"
  }
else
  context.output = {
    result = "This might show the user with id "..userId
  }
end

context.response.status = 200
