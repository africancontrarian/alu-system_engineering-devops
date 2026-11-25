# Web stack debugging #4

Fixing operating system limits that cause failures under load.

## Files

| # | File | Description |
|---|------|-------------|
| 0 | `0-the_sky_is_the_limit_not.pp` | Nginx failed about half of the requests of `ab -c 100 -n 2000` with "Too many open files", because `/etc/default/nginx` sets `ULIMIT="-n 15"`. The manifest raises it to 4096 and restarts Nginx |
| 1 | `1-user_limit.pp` | `/etc/security/limits.conf` limits the `holberton` user to 4 (soft) and 5 (hard) open files. The manifest raises both to 50000 |

## Usage

```
root@container:/# puppet apply 0-the_sky_is_the_limit_not.pp
root@container:/# ab -c 100 -n 2000 localhost/
Failed requests:        0

root@container:~# puppet apply 1-user_limit.pp
root@container:~# su - holberton
holberton@container:~$ head /etc/passwd
```
