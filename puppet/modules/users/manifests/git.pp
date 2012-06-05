class users::git {
  user {'git':
    gid => 'git',
    ensure => present,
    home => '/var/git',
    managehome => true,
    shell => '/bin/bash',
  }

  group { 'git':
    ensure => present,
  }

  file { '/var/git/.ssh':
    ensure => 'directory',
    mode => 700,
    owner => 'git',
    group => 'git',
    require => User['git'],
  }

  file { '/var/git/.ssh/authorized_keys':
    ensure => present,
    source => 'puppet:///modules/users/authorized_keys',
    owner => 'git',
    group => 'git',
  }
}