node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

node 'ip-172-31-0-115.eu-west-3.compute.internal' {   # Ubuntu
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
    ip => '172.31.0.115',
  }
}

node 'ip-172-31-7-144.eu-west-3.compute.internal' {   # RedHat
  include apache

  apache::vhost { 'ny':
    server_name   => 'ny.grtsokos.com',
    document_root => 'ny',
  }

  host { 'ny.grtsokos.com':
    ip => '172.31.7.144',
  }
}

package { 'lynx':
  ensure => present,
}
