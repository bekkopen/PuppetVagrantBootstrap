class maven {
	$maven_bundle = "/tmp/apache-maven-3.0.4-bin.tar.gz"
	file {
		$maven_bundle :
			ensure => present,
			require => Exec["Fetch maven"],
	}
	exec {
		"Fetch maven" :
			cwd => "/tmp",
			command => "wget 'http://apache.uib.no//maven/binaries/apache-maven-3.0.4-bin.tar.gz'",
			creates => $maven_bundle,
			path => ["/usr/bin", "/bin"],
	}
	file {
		"/opt/apache-maven-3.0.4" :
			require => Exec["Extract maven"],
	}
	exec {
		"Extract maven" :
			cwd => "/opt",
			command => "tar xvf $maven_bundle",
			creates => '/opt/apache-maven-3.0.4',
			path => ["/usr/bin", "/bin"],
			require => File[$maven_bundle]
	}
	file {
		"/opt/maven" :
			ensure => link,
			target => "/opt/apache-maven-3.0.4",
			require => File['/opt/apache-maven-3.0.4'],
	}
	file {
		"/usr/bin/mvn" :
			ensure => link,
			target => "/opt/maven/bin/mvn",
			require => File['/opt/maven'],
	}
}