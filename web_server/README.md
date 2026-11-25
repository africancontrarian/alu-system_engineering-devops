# Web server

Bash scripts that copy files to a server and configure an Nginx web server on a
brand new Ubuntu machine, plus a custom 404 page.

## Requirements

- Ubuntu 16.04 LTS
- Bash scripts start with `#!/usr/bin/env bash`, have a comment on line 2, are
  executable and pass ShellCheck without any error
- Scripts that configure the server run as root and never use `systemctl` to
  restart a process (`service nginx restart` is used instead)
- All files end with a new line

## Files

| # | File | Description |
|---|------|-------------|
| 0 | `0-transfer_file` | Copies a file to the home directory of a server with `scp` (strict host key checking disabled) |
| 1 | `1-install_nginx_web_server` | Installs Nginx and serves a page containing `Holberton School` on port 80 |
| 3 | `3-redirection` | Same as task 1, plus a `301 Moved Permanently` redirection for `/redirect_me` |
| 4 | `4-not_found_page_404` | Same as task 3, plus a custom 404 page containing `Ceci n'est pas une page` |
| 5 | `5-design_a_beautiful_404_page.html` | A designed, self-contained 404 page |

## Usage

Transfer a file to a server:

```
$ ./0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
```

Configure a machine (run on the server itself, as root):

```
# ./4-not_found_page_404
$ curl -sI localhost/redirect_me/
HTTP/1.1 301 Moved Permanently
$ curl -sI localhost/xyz
HTTP/1.1 404 Not Found
$ curl localhost/xyz
Ceci n'est pas une page
```

Each configuration script is self-contained, so the latest one (`4-not_found_page_404`)
sets up everything asked by tasks 1, 3 and 4. They can safely be run more than once.

`5-design_a_beautiful_404_page.html` keeps the exact string `Ceci n'est pas une page`,
so it can replace `/var/www/html/404.html` without breaking the task 4 check.
