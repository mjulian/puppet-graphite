#
class graphite::install {
  exec {'Download carbon':
    command => 'wget -O /tmp/carbon.zip https://github.com/graphite-project/carbon/archive/master.zip',
    unless  => 'test -f /tmp/carbon.zip',
    path    => ['/bin:/usr/bin:/usr/sbin:/sbin'],
  }
  exec {'Download whisper':
    command => 'wget -O /tmp/whisper.zip https://github.com/graphite-project/whisper/archive/master.zip',
    unless  => 'test -f /tmp/whisper.zip',
    path    => ['/bin:/usr/bin:/usr/sbin:/sbin'],
  }

  exec {'Unzip carbon':
    command => 'unzip /tmp/carbon.zip -d /tmp/carbon',
    unless  => 'test -d /tmp/carbon/carbon-master',
    path    => ['/bin:/usr/bin:/usr/sbin:/sbin'],
    require => Exec['Download carbon'],
  }
  exec {'Unzip whisper':
    command => 'unzip /tmp/whisper.zip -d /tmp/whisper',
    unless  => 'test -d /tmp/whisper/whisper-master',
    path    => ['/bin:/usr/bin:/usr/sbin:/sbin'],
    require => Exec['Download whisper'],
  }

  exec {'Install carbon':
    command => 'python setup.py install',
    path    => ['/bin:/usr/bin:/usr/sbin:/sbin'],
    cwd     => '/tmp/carbon/carbon-master',
    require => Exec['Unzip carbon'],
  }
  exec {'Install whisper':
    command => 'python setup.py install',
    path    => ['/bin:/usr/bin:/usr/sbin:/sbin'],
    cwd     => '/tmp/whisper/whisper-master',
    require => Exec['Unzip whisper'],
  }
}
