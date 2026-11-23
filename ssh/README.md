# SSH

Scripts and configuration for connecting to a remote server over SSH with an
RSA key pair instead of a password.

## Requirements

- Ubuntu 20.04 LTS
- Bash scripts start with `#!/usr/bin/env bash`, have a comment on line 2 and
  are executable
- All files end with a new line

## Files

| # | File | Description |
|---|------|-------------|
| 1 | `1-create_ssh_key_pair` | Creates a 4096-bit RSA key pair named `school`, protected by a passphrase |
| 2 | `2-ssh_config` | SSH client configuration: uses `~/.ssh/school` and refuses password authentication |

## Usage

Generate the key pair outside of this repository, then move it to `~/.ssh`:

```
$ mkdir -p /tmp/keys && cd /tmp/keys
$ /path/to/ssh/1-create_ssh_key_pair
$ mv school school.pub ~/.ssh/ && chmod 600 ~/.ssh/school
```

Never commit the private key. `.gitignore` excludes `school` and `school.pub`.

To use the client configuration, add the content of `2-ssh_config` to
`~/.ssh/config`:

```
Host *
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
```

Check what SSH will use for a host with `ssh -G user@host`.
