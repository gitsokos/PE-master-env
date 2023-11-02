class linode {

  $pkgs = ['curl','finger','firewalld','net-tools','ssh','tree','vim']

  $pkgs.each | String $pkg| {
    package { "${pkg}":
      ensure => latest,
    }
  }
}
