# Configures the SSH client to use the private key ~/.ssh/school
# and to refuse to authenticate using a password

file_line { 'Turn off passwd auth':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => '    PasswordAuthentication no',
  match    => '^\s*PasswordAuthentication\s',
  multiple => true,
}

file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '    IdentityFile ~/.ssh/school',
}
