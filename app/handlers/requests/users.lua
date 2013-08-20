context.template = {
  type = "mustache",
  name = "app/templates/layout",

  partials = {
    content = "app/templates/users",
  }
}

if not userId or userId == '' then
  --context.statsd:increment("users.get", 1)

  context.output = {
    result = "This might show a list of users"
  }
else
  --context.statsd:increment("user.get", 1)

  context.output = {
    result = "This might show the user with id "..userId
  }
end

context.response.status = 200
