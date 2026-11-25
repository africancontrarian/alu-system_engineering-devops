# Firewall

Configuring `ufw` on web-01.

## Files

| # | File | Description |
|---|------|-------------|
| 0 | `0-block_all_incoming_traffic_but` | ufw commands that block all incoming traffic except TCP ports 22 (SSH), 80 (HTTP) and 443 (HTTPS) |
| 1 | `100-port_forwarding` | Copy of `/etc/ufw/before.rules` with a `nat` table rule that redirects TCP port 8080 to port 80 |

## Usage

On web-01, as root. Port 22 is allowed before ufw is enabled, so the SSH session is not cut:

```
root@7310-web-01:~# ./0-block_all_incoming_traffic_but
root@7310-web-01:~# ufw status
```

For port forwarding, replace `/etc/ufw/before.rules` with `100-port_forwarding` and reload:

```
root@7310-web-01:~# cp 100-port_forwarding /etc/ufw/before.rules
root@7310-web-01:~# ufw reload
```

From another machine, `curl -sI WEB01_IP:8080` now returns the same response as port 80.
