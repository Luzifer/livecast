# Install mumble
include mumble

# Create an user for running mumble client
user { 'mrstream':
  ensure => present,
  home => '/home/mrstream',
  managehome => true
}

file { '/home/mrstream/.asoundrc':
  owner => 'mrstream',
  content => 'pcm.pulse {
    type pulse
}
ctl.pulse {
    type pulse
}
pcm.!default {
    type pulse
}
ctl.!default {
    type pulse
}',
  require => User['mrstream']
}

# Install pulseaudio
package { 'pulseaudio':
  ensure => latest
}

service { 'pulseaudio':
  ensure => running
}

exec { 'activate null-sink':
  command => '/bin/echo "load-module module-null-sink" >> /etc/pulse/default.pa',
  unless => '/bin/grep -q "^[^#]oad-module module-null-sink" /etc/pulse/default.pa',
  require => Package['pulseaudio'],
  notify => Service['pulseaudio']
}

# Install alsa
package { 'alsa-tools': }
package { 'alsa-utils': }

# Install icecast

icecast { 'icecast':
  serverpassword => '4CicG7XuRG2T3C2qnKPN'
}
