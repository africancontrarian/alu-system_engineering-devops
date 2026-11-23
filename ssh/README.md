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
| 4 | `100-puppet_ssh_config.pp` | Puppet manifest that applies the same client configuration to `/etc/ssh/ssh_config` |

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

### Puppet (task 4)

`100-puppet_ssh_config.pp` uses `file_line` from the `puppetlabs-stdlib`
module, which must be installed (`puppet module install puppetlabs-stdlib`).

```
$ sudo puppet apply 100-puppet_ssh_config.pp
Notice: Compiled catalog for ubuntu in environment production in 0.02 seconds
Notice: /Stage[main]/Main/File_line[Turn off passwd auth]/ensure: created
Notice: /Stage[main]/Main/File_line[Declare identity file]/ensure: created
Notice: Applied catalog in 0.01 seconds
```

Running it again changes nothing. An existing active `PasswordAuthentication`
line is replaced, so the final setting is always `no`.
