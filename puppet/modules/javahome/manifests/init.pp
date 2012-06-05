class javahome {
	file {
		'/etc/environment' :
			ensure => present,
			mode => 644,
			owner => 'root',
			source => 'puppet:///modules/javahome/environment',
	}
}
