class apache::params {
  $install_name = $facts['os']['family'] ? {
    'RedHat' => 'httpd',
    'Debian' => 'apache2',
    default  => 'httpd',
  }
}
