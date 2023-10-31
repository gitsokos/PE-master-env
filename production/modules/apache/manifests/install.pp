class apache::install (
  $pkg_name = $apache::params::install_name,
) inherits apache::params {
  package { "${pkg_name}":
    ensure => present,
  }
}
