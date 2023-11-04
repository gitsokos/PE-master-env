node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

node /eu-west-3.compute.internal$/ {
  include  cowsay
}

node 'ip-172-31-7-127.eu-west-3.compute.internal' {   # Ubuntu
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
    ip => '172.31.7.127',
  }

  file { '/tmp/ubuntu1':
    ensure => present,
  }
}

node 'ip-172-31-29-154.eu-west-3.compute.internal' {   # RedHat
  include apache

  apache::vhost { 'ny':
    server_name   => 'ny.grtsokos.com',
    document_root => 'ny',
  }

  host { 'ny.grtsokos.com':
    ip => '172.31.29.154',
  }

  file { '/tmp/redhat1':
    ensure => present,
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
