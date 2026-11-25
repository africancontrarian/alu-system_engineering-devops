# Web stack debugging #3

A WordPress site on a LAMP stack returns a 500 error.

## Debugging

Attaching `strace` to the Apache process (`strace -p PID -f`) while running `curl -sI 127.0.0.1` in another tmux window shows Apache failing to open a file ending in `.phpp`. `wp-settings.php` requires `class-wp-locale.phpp` instead of `class-wp-locale.php`.

## Files

| # | File | Description |
|---|------|-------------|
| 0 | `0-strace_is_your_friend.pp` | Puppet manifest that replaces `phpp` with `php` in `/var/www/html/wp-settings.php` |

## Usage

```
root@container:~# puppet apply 0-strace_is_your_friend.pp
root@container:~# curl -sI 127.0.0.1:80
HTTP/1.1 200 OK
```
