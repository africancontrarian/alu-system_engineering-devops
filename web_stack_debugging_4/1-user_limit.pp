# Raises the open file limits of the holberton user so it can login and open files without errors
exec { 'change-os-configuration-for-holberton-user':
  command => 'sed -Ei "s/^holberton\s+(hard|soft)\s+nofile\s+[0-9]+/holberton \1 nofile 50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/:/usr/bin/',
}
