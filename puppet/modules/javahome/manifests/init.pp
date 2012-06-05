class javahome {
	file {
		'/usr/local/app/.bashrc' :
			ensure => present,
			mode => 644,
			owner => 'appuser',
			source => 'puppet:///modules/javahome/bashrc',
	}
}
