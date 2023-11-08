node default {
  file { '/tmp/test-default':
    ensure => present,
  }
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

#node /eu-west-3.compute.internal$/ {

#  include motd

#  include  cowsay
#  file { '/tmp/testfilemodule':
#    source => 'puppet:///modules/cowsay/testfile',
#  }
#  file { '/tmp/testfilefile':
#    source => '/tmp/test4',
#  }
#}

node "ip-172-31-13-0.eu-west-3.compute.internal" {   # Master
  include motd

  include  cowsay

  file { '/tmp/test-master':
    ensure => present,
  }
}

node /^ip-172-31-13-10[0-9].eu-west-3.compute.internal$/ {   # Ubuntu
  include motd

  include  cowsay

  file { '/tmp/test-ubuntu':
    ensure => present,
  }
}

node nothing1 {
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

node /^ip-172-31-13-15[0-9].eu-west-3.compute.internal$/ {   # RedHat
  include motd

  include  cowsay

  file { '/tmp/test-redhat':
    ensure => present,
  }
}

node nothing2 {
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

