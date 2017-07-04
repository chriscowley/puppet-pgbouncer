# == Class pgbouncer::config
#
# This class is called from pgbouncer for service config.
#
class pgbouncer::config {
  $auth_type = $pgbouncer::auth_type
  $auth_file = $pgbouncer::auth_file

  $listen_addr = $pgbouncer::listen_addr
  $listen_port = $pgbouncer::listen_port
  $admin_users = $pgbouncer::admin_users
  $stats_users = $pgbouncer::stats_users
  $pool_mode   = $pgbouncer::pool_mode
  $server_reset_query = $pgbouncer::server_reset_query
  $max_client_conn = $pgbouncer::max_client_conn
  $default_pool_size = $pgbouncer::default_pool_size
  $users     = $pgbouncer::users

  file { $auth_file:
    ensure  => present,
    content => epp('pgbouncer/userlist.txt.epp', {
      users => $users
      })
  }

  file {'/etc/pgbouncer/pgbouncer.ini':
    ensure               => present,
    content              => epp('pgbouncer/pgbouncer.ini.epp', {
      listen_addr        => $listen_addr,
      listen_port        => $listen_port,
      auth_file          => $auth_file,
      auth_type          => $auth_type,
      admin_users        => $admin_users,
      stats_users        => $stats_users,
      pool_mode          => $pool_mode,
      server_reset_query => $server_reset_query,
      max_client_conn    => $max_client_conn,
      default_pool_size  => $default_pool_size,
      }
    )
  }
  
}
