local levels = {
  debug   = ngx.DEBUG,
  info    = ngx.INFO,
  warning = ngx.WARN,
  error   = ngx.ERR
}

return {
  handler = function(context)
    ngx.log(levels[context.level or "debug"], context.message)
    return context, true
  end
}
