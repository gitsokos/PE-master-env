class cowsay::cowsay {

  case $facts['os']['family'] {
    'Debian': {
      package { 'cowsay':
        ensure => present,
      }
    }
    default: {
      package { 'cowsay':
        ensure   => present,
        provider => 'gem',
      }
    }
  }
}
