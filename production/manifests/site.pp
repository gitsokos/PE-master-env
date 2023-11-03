node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

node 'ip-172-31-14-17.eu-west-3.compute.internal' {   # Ubuntu
  include apache

  apache::vhost { 'utah':
    server_name   => 'utah.grtsokos.com',
    document_root => 'utah',
  }

  class { 'apache::ensite':
    vhost_file => 'utah.grtsokos.com.conf',
    require    => Apache::Vhost['utah'],
  }

  host { 'utah.grtsokos.com':
    ip => '172.31.14.17',
  }
}

node 'ip-172-31-1-231.eu-west-3.compute.internal' {   # RedHat
  include apache

  apache::vhost { 'ny':
    server_name   => 'ny.grtsokos.com',
    document_root => 'ny',
  }

  host { 'ny.grtsokos.com':
    ip => '172.31.1.231',
  }
}

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

file { '/tmp/test4':
  ensure => present,
}
