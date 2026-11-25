# Load balancer

Two web servers (web-01 and web-02) behind an HAproxy load balancer (lb-01).

## Requirements

- Ubuntu 16.04 LTS
- Bash scripts start with `#!/usr/bin/env bash`, have a comment on line 2, are executable and pass Shellcheck
- All files end with a new line

## Files

| # | File | Description |
|---|------|-------------|
| 0 | `0-custom_http_response_header` | Installs Nginx (Holberton School page, `/redirect_me` 301, custom 404) and adds the `X-Served-By` header set to the hostname. Run on web-01 and web-02 |
| 1 | `1-install_load_balancer` | Installs HAproxy on lb-01 and sends traffic to web-01 and web-02 with `roundrobin`, managed by the init script |

## Usage

```
root@7310-web-01:~# ./0-custom_http_response_header
root@7310-web-02:~# ./0-custom_http_response_header
root@7310-lb-01:~# ./1-install_load_balancer
```

Check that requests alternate between the two servers:

```
$ curl -sI LB01_IP | grep X-Served-By
X-Served-By: 7310-web-01
$ curl -sI LB01_IP | grep X-Served-By
X-Served-By: 7310-web-02
```
