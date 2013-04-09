package = "lusty-example"
version = "1.0-1"
source = {
  url = "",
  dir = "."
}
description = {
  summary = "Lusty Example",
  detailed = [[
    An example of a website using Lusty
  ]],
  homepage = "https://github.com/Olivine-Labs/lusty-example",
  license = "Copyright 2013 Olivine Labs"
}
dependencies = {
  "lua >= 5.1",
  "lua_cliargs >= 2.0",
  "busted >= 1.5.0",
  "lustache >= 1.1-1"
}
build = {
  type = "builtin",
  modules = {
  },
  install = {
  }
}
