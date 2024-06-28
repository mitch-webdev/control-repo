class profile::apache (
  Array[String[1]] $mods = [],
  Boolean $default_vhost = false,
  Boolean $purge_configs = false,
  Hash $vhosts = {},
) {

  $vhosts.each |$k,$m| {
    apache::vhost { $k:
      * => $m
    }
  }

  class { 'apache':
    vhost_dir     => '/etc/httpd/vhosts.d',
    mpm_module    => false,
    default_vhost => $default_vhost,
    purge_configs => $purge_configs,
  }

#  # Most basic vhost
#  apache::vhost { 'example1.com':
#    port    => 80,
#    docroot => '/var/www1',
#    servername => 'example1.com',
#    error_log => false,
#    access_log => false,
#    directories => [ {} ],
#  }
#  # Most basic vhost
#  apache::vhost { 'example2.com':
#    port    => 81,
#    docroot => '/var/www2',
#    servername => 'example2.com',
#    error_log => false,
#    access_log => false,
#    directories => [ {} ],
#  }
#}
