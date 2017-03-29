
class { '::apache':
  default_vhost  => false,
  service_manage => false,
  use_systemd    => false,
}

$apache_balancers = hiera('apache_balancers')
create_resources('::apache::balancer', $apache_balancers)

$apache_balancermembers = hiera('apache_balancers')
create_resources('::apache::balancermamber', $apache_balancermembers)

$apache_custom_configs = hiera('apache_custom_configs')
create_resources('::apache::custom_config', $apache_custom_configs)

$apache_fastcgi_servers = hiera('apache_fastcgi_servers')
create_resources('::apache::fastcgi::server', $apache_fastcgi_servers)

$apache_listens = hiera('apache_listens')
create_resources('::apache::listen', $apache_listens)

$apache_mods = hiera('apache_mods')   # Note: Don't manually set this parameter without a specific reason
create_resources('::apache::mod', $apache_mods)

$apache_namevirtualhosts = hiera('apache_namevirtualhosts')
create_resources('::apache::namevirtualhost', $apache_namevirtualhosts)

$apache_vhosts = hiera('apache_vhosts')
create_resources('::apache::vhost', $apache_vhosts)

$apache_vhost_customs = hiera('apache_vhost_customs')
create_resources('::apache::vhost::custom', $apache_vhost_customs)

#apache::vhost { 'localhost':
#  port    => '80',
#  docroot => '/var/www/html',
#}

file { '/var/www/html/index.html':
  ensure  => present,
  content => 'built by Puppet\n',
}
