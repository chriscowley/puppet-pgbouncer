# == Class pgbouncer::install
#
# This class is called from pgbouncer for install.
#
class pgbouncer::install {
  if $manage_repo {
    include packagecloud

    packagecloud::repo { "chriscowleyunix/tools":
      type => 'rpm',
    }
  }
  package { $::pgbouncer::package_name:
    ensure => present,
  }
}
