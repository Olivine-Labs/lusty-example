Lusty Example
=============

Show off a lusty webserver.

Installation
------------

Clone / fork repository

Install [luajit](http://luajit.org/) (`brew install luajit` on OSX)

Install [luarocks](http://luarocks.org/) (`brew install luarocks` on OSX)

* Save this to `~/.luarocks/config.lua` or relevant place, to load our rocks
from the alternate rocks.moonscript.org server:

```
rocks_servers = {
  "http://rocks.moonscript.org/",
  "http://luarocks.org/repositories/rocks/",
}
```

Install dependencies (`luarocks make`)

Install [openresty](http://openresty.org/#Installation) 

Symlink `nginx` to your openresty installation

Run `restart.sh` (or, start nginx with `conf/nginx.conf`)

