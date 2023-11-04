class cowsay::fortune {

#  case $facts['os']['family'] {
#    'Debian': {

      package { 'fortune-mod':
        ensure => present,
      }

#    }
#    default : {
#      package { 'epel-release':
#        ensure => present,
#      }
#      package { 'fortune-mod':
#        ensure => present,
#      }
#    }
#  }
}
