# Raises the Nginx open file limit so that it can handle a high number of concurrent requests
exec { 'fix--for-nginx':
  command => "sed -i 's/^ULIMIT=.*/ULIMIT=\"-n 4096\"/' /etc/default/nginx",
  path    => '/usr/local/bin/:/bin/:/usr/bin/',
}

exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => '/usr/sbin/:/usr/bin/:/sbin/:/bin/',
  require => Exec['fix--for-nginx'],
}
