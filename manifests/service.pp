#
class graphite::service {
  service {'carbon-cache':
    ensure  => running,
    enable  => true,
    require => File['/etc/init.d/carbon-cache'],
  }
  service {'carbon-relay':
    ensure  => stopped,
    enable  => false,
    require => File['/etc/init.d/carbon-relay'],
  }
  service {'carbon-aggregator':
    ensure  => stopped,
    enable  => false,
    require => File['/etc/init.d/carbon-aggregator'],
  }

  # The packages don't push out their own init scripts.
  file {'/etc/init.d/carbon-cache':
    ensure  => present,
    source  => 'puppet:///modules/graphite/carbon-cache_init',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
  file {'/etc/init.d/carbon-relay':
    ensure  => present,
    source  => 'puppet:///modules/graphite/carbon-relay_init',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
  file {'/etc/init.d/carbon-aggregator':
    ensure  => present,
    source  => 'puppet:///modules/graphite/carbon-aggregator_init',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
}
