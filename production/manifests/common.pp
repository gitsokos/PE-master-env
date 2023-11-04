package { 'lynx':
  ensure => present,
}

package { 'ruby':
  ensure => present,
}

exec { '/usr/bin/echo PermitRootLogin yes >> /etc/ssh/sshd_config':
  unless      => '/usr/bin/grep -q "PermitRootLogin yes" /etc/ssh/sshd_config 2>/dev/null',
  notify      => Service['sshd'],
}

service { 'sshd':
  hasrestart  => true,
  ensure      => running,
}

file { '/tmp/test-common':
  ensure => present,
}
