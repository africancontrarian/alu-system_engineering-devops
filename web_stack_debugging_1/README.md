# Web stack debugging #1

Nginx is installed but not listening on port 80: the enabled site does not point to the default configuration listening on port 80.

## Files

| # | File | Description |
|---|------|-------------|
| 0 | `0-nginx_likes_port_80` | Makes the default site listen on port 80, links it into `sites-enabled` and restarts Nginx |
| 1 | `1-debugging_made_short` | The same fix in 5 lines, without `;` or `&&`. Nginx keeps serving on port 80 while `service nginx status` reports it is not running, because the pid file is emptied |
