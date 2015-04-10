#
class graphite::prereqs {
  # These requirements came from carbon's requirements.txt
  python::pip {'mocker':
    ensure     => present,
    pkgname    => 'mocker==1.1.1',
  }
  python::pip {'Twisted':
    ensure     => present,
    pkgname    => 'Twisted==13.2.0',
  }

  class {'python':
    version    => 'system',
    pip        => true,
    dev        => true,
    virtualenv => true,
  }
}
