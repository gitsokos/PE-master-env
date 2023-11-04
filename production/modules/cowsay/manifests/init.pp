class cowsay {

#  case $facts['os']['family'] {
#    'Debian': {
#      package { 'cowsay':
#        ensure => present,
#      }
#    }
#    default: {
#      package { 'gem':
#        ensure   => present,
#        provider => 'yum',
#      }

#      package { 'cowsay':
#        ensure   => present,
#        provider => 'gem',
#      }
#    }
#  }
#  include cowsay::fortune

  case $facts['os']['family'] {
    'RedHat': {
      include cowsay::gem
    }
  }
  include cowsay::cowsay
  case $facts['os']['family'] {
    'RedHat': {
      include cowsay::epel
    }
  }
  include cowsay::fortune
}
