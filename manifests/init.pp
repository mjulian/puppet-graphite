#
class graphite (
  $app_root = '/opt/graphite',
  $app_user = 'graphite',
) {
  Class['graphite::prereqs'] ->
  Class['graphite::install'] ->
  Class['graphite::config'] ~>
  Class['graphite::service']

  include 'graphite::prereqs'
  include 'graphite::install'
  include 'graphite::config'
  include 'graphite::service'

  firewall { '110 allow carbon and carbon-pickle access':
    dport  => [2003, 2004],
    state  => 'NEW',
    proto  => tcp,
    action => accept,
  }

  user {$graphite::app_user:
    ensure => present,
    home   => $graphite::app_root,
    shell  => '/bin/bash',
  }
}
