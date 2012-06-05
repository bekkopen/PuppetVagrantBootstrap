class java {
	package {
		"java-1.6.0-openjdk" :
			ensure => absent,
	}
	exec {
		"jdk_install" :
			cwd => "/opt",
			command => "/opt/jdk-6u22-linux-x64.bin",
			creates => "/opt/jdk1.6.0_22/bin/javac",
			require => [Package["java-1.6.0-openjdk"],
			File["/opt/jdk-6u22-linux-x64.bin"]],
	}
	file {
		"/opt/jdk-6u22-linux-x64.bin" :
			ensure => present,
			source => "puppet:///modules/java/jdk-6u22-linux-x64.bin" ;
	}
	file {
		"/usr/local/app/java" :
			ensure => link,
			target => "/opt/jdk1.6.0_22",
			require => [Exec["jdk_install"]],
	}
	file {
		"/opt/java" :
			ensure => link,
			target => "/opt/jdk1.6.0_22",
			require => [Exec["jdk_install"]],
	}
}