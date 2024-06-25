# The base profile should include component modules that will be on all nodes
class profile::apache {
  class { 'apache':
    mpm_module    => false,
    default_mods  => false,
    default_vhost => false,
    purge_configs => false,
  }
}
