# == Class: git
#
# Installs git
#
class git {
  package { ['git']:
    ensure => present;
  }
}
