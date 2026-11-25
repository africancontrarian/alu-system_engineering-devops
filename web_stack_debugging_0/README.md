# Web stack debugging #0

Getting Apache to return `Hello Holberton` in the `holbertonschool/265-0` container.

## Files

| # | File | Description |
|---|------|-------------|
| 0 | `0-give_me_a_page` | Starts Apache, which was installed but not running in the container |

## Usage

```
$ docker run -p 8080:80 -d -it holbertonschool/265-0
$ docker exec -it CONTAINER_ID bash
root@container:/# ./0-give_me_a_page
$ curl 0:8080
Hello Holberton
```
