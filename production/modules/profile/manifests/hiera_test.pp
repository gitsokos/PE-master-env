# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::hiera_test

# /etc/puppetlabs/code/environments/production/modules/profile/manifests/hiera_test.pp
class profile::hiera_test (
  Boolean             $ssl,
  Boolean             $backups_enabled,
  String[1]           $param1,
  String[1]           $param2,
  Optional[String[1]] $site_alias = undef,
) {
  file { '/tmp/hiera_test.txt':
    ensure  => file,
    content => @("END"),
               Data from profile::hiera_test
               -----
               profile::hiera_test::ssl: ${ssl}
               profile::hiera_test::backups_enabled: ${backups_enabled}
               profile::hiera_test::site_alias: ${site_alias}
               profile::hiera_test::param1: ${param1}
               profile::hiera_test::param2: ${param2}
               |END
    owner   => root,
    mode    => '0644',
  }
}
