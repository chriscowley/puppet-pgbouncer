# Class: pgbouncer
# ===========================
#
# Full description of class pgbouncer here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class pgbouncer (
  $manage_repo        = $::pgbouncer::params::manage_repo,
  $package_name       = $::pgbouncer::params::package_name,
  $service_name       = $::pgbouncer::params::service_name,
  $listen_addr        = $::pgbouncer::params::listen_addr,
  $listen_port        = $::pgbouncer::params::listen_port,
  $auth_type          = $::pgbouncer::params::auth_type,
  $auth_file          = $::pgbouncer::params::auth_file,
  $admin_users        = $::pgbouncer::params::admin_users,
  $stats_users        = $::pgbouncer::params::stats_users,
  $pool_mode          = $::pgbouncer::params::pool_mode,
  $server_reset_query = $::pgbouncer::params::server_reset_query,
  $max_client_conn    = $::pgbouncer::params::max_client_conn,
  $default_pool_size  = $::pgbouncer::params::default_pool_size,
) inherits ::pgbouncer::params {

  # validate parameters here

  class { '::pgbouncer::install': } ->
  class { '::pgbouncer::config': } ~>
  class { '::pgbouncer::service': } ->
  Class['::pgbouncer']
}
