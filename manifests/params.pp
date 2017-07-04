# == Class pgbouncer::params
#
# This class is meant to be called from pgbouncer.
# It sets variables according to platform.
#
class pgbouncer::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'pgbouncer'
      $service_name = 'pgbouncer'
    }
    'RedHat', 'Amazon': {
      $manage_repo  = 'true'
      $package_name = 'pgbouncer'
      $service_name = 'pgbouncer'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $listen_addr        = '*'
  $listen_port        = '6432'
  $auth_type          = 'md5'
  $auth_file          = '/etc/pgbouncer/userlist.txt'
  $admin_users        = lookup({
    'name'          => 'pgbouncer::admin_users',
    'value_type'    => Array,
    'default_value' => '["postgres"]'
    })
  $stats_users        = ['stats', 'postgres']
  $stats_users        = lookup({
    'name'          => 'pgbouncer::stats_users',
    'value_type'    => Array,
    'default_value' => '["stats", "postgres"]'
    })

  $pool_mode          = 'session'
  $server_reset_query = 'DISCARD ALL'
  $max_client_conn    = 100
  $default_pool_size  = 20

  $databases          = lookup({
    'name'          => 'pgbouncer::databases',
    'value_type'    => Array,
    'default_value' => '[]'
    })
  $users              = lookup({
    'name'          => 'pgbouncer::users',
    'value_type'    => Array,
    'default_value' => '[]'
    })
}
