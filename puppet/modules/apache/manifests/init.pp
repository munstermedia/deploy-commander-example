# == Class: apache
#
# Installs packages for Apache2, enables modules, and sets config files.
#
class apache {
  package { ['apache2']:
    ensure => present;
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'];
  }
  
  apache::conf { ['apache2.conf', 'envvars', 'ports.conf']: }
  apache::module { ['expires.load', 'proxy.conf', 'proxy.load', 'proxy_http.load', 'rewrite.load']: }
}
