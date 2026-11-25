# Web stack debugging #2

Running software as a less privileged user.

## Files

| # | File | Description |
|---|------|-------------|
| 0 | `0-iamsomeoneelse` | Runs `whoami` as the user given as the first argument |
| 1 | `1-run_nginx_as_nginx` | Stops Apache (which holds port 8080), sets `user nginx` in `nginx.conf`, makes Nginx listen on port 8080 and restarts it as the `nginx` user |
| 2 | `100-fix_in_7_lines_or_less` | The same fix in 7 lines, without `;`, `&&` or `wget` |

## Usage

```
root@container:~# ./0-iamsomeoneelse www-data
www-data
root@container:~# ./1-run_nginx_as_nginx
root@container:~# ps auxff | grep ngin[x]
root@container:~# nc -z 0 8080 ; echo $?
0
```
