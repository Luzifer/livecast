define icecast ($serverpassword) {

  package { 'icecast2':
    ensure => latest
  }

  service { 'icecast2':
    ensure => running,
    require => Package['icecast2']
  }

  file { '/etc/icecast2/icecast.xml':
    ensure => present,
    content => template('icecast/icecast.xml.erb'),
    require => Package['icecast2'],
    notify => Service['icecast2']
  }

}
