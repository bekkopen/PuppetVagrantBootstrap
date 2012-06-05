class users::appuser {
  user {'appuser':
    gid => 'appuser',
    ensure => present,
    home => '/usr/local/app',
    managehome => true,
    shell => '/bin/bash',
  }

  group { 'appuser':
    ensure => present,
  }

  file { '/usr/local/app/.ssh':
    ensure => 'directory',
    mode => 700,
    owner => 'appuser',
    group => 'appuser',
    require => User['appuser'],
  }

  file { '/usr/local/app/.ssh/authorized_keys':
    ensure => present,
    source => 'puppet:///modules/users/authorized_keys',
    owner => 'appuser',
    group => 'appuser',
  }
}
