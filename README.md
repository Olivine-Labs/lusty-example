Lusty Example
=============

Show off a lusty webserver.

Installation
------------

#### Lua Environment

Install [luajit](http://luajit.org/) (`brew install luajit` on OSX)

Install [luarocks](http://luarocks.org/) (`brew install luarocks` on OSX)

Save this to `~/.luarocks/config.lua` or relevant place, to load our rocks
from the alternate rocks.moonscript.org server:

```
rocks_servers = {
  "http://rocks.moonscript.org/",
  "http://luarocks.org/repositories/rocks/",
}
```

#### Nginx + Lua

Install [openresty](http://openresty.org/#Installation)

(Note: on OSX, you can `brew install https://raw.github.com/marcqualie/homebrew-nginx/master/openresty.rb`)

Optional: symlink `nginx` to the nginx provided by openresty

#### Lua Environment

Clone / fork repository

Install dependencies (`luarocks make`)

Start openresty/nginx, pointing at conf/nginx.conf:

```
openresty -p `pwd`/ -c conf/nginx.conf
```

(depending on how you installed openresty, this may be `nginx` instead of `openresty`)

Visit localhost:8080 (try making ajax requests, too:
`curl http://localhost:8080 -H "Accept: application/json"`)

Post-Installation
-----------------

Try:

* Play with the data in `app/handlers/requests` and the templates in
  `app/templates` and see what you can do.
* Add new routes in `app/app.lua` by adding new keys to the request table
  and see what new endpoints you can add, for templates or json data
* Try building a new lusty module; view https://github.com/Olivine-Labs for
  examples (named `lusty-*`)

