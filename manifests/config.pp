#
class graphite::config {
  file {"$graphite::app_root/conf/carbon.conf":
    ensure => present,
    source => 'puppet:///modules/graphite/carbon.conf',
  }

  file {"$graphite::app_root/conf/relay-rules.conf":
    ensure => present,
    source => 'puppet:///modules/graphite/relay-rules.conf',
  }

  file {"$graphite::app_root/conf/storage-aggregation.conf":
    ensure => present,
    source => 'puppet:///modules/graphite/storage-aggregation.conf',
  }

  file {"$graphite::app_root/conf/storage-schemas.conf":
    ensure => present,
    source => 'puppet:///modules/graphite/storage-schemas.conf',
  }
}
