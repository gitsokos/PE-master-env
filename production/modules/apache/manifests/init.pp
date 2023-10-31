class apache (
  String $install_name,
   Array $config_paths,
  String $service_name,
) {
  contain apache::install
  contain apache::config
  contain apache::service

  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
}
