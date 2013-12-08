class mumble {

  # Require mumble PPA repository
  class { 'apt': }
  apt::ppa { 'ppa:mumble/release': }

  package { 'mumble':
    ensure => 'latest',
    require => Apt::Ppa['ppa:mumble/release']
  }

  package { 'mumble-server':
    ensure => 'latest',
    require => Apt::Ppa['ppa:mumble/release']
  }

  service { 'mumble-server':
    ensure => 'running',
    require => [ Package['mumble-server'], File['/etc/mumble-server.ini'] ]
  }

  file { '/etc/mumble-server.ini':
    ensure => present,
    source => 'puppet:///modules/mumble/mumble-server.ini',
    notify => Service['mumble-server']
  }

}
