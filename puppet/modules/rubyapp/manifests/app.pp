define rubyapp::app() {
  # name is implicit
  user {$name:
    gid => $name,
    ensure => present,
    home => "/home/${name}",
    managehome => true,
    shell => '/bin/bash',
  }

  group { $name:
    ensure => present,
  }

  file { "/home/${name}/.ssh":
    ensure => 'directory',
    mode => 700,
    owner => $name,
    group => $name,
    require => User[$name],
  }

  file { "/home/${name}/.ssh/authorized_keys":
    ensure => present,
    source => 'puppet:///modules/users/authorized_keys',
    owner => $name,
    group => $name,
  }

}