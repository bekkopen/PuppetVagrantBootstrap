class webapp {

	$webapp = "webapp-1.0.zip"

        file { "/usr/local/app/$webapp":
          ensure => present,
          source => "puppet:///modules/webapp/$webapp",
          owner => 'appuser',
          group => 'appuser',
        }

	exec { 'Extract webapp' :
          user => 'appuser',
          cwd => "/usr/local/app",
          command => "unzip -qq $webapp",
          creates => '/usr/local/app/webapp-1.0',
          path => ["/usr/bin", "/bin"],
          require => File["/usr/local/app/$webapp"],
        }

        file { '/usr/local/app/webapp' :
          ensure => link,
          target => "/usr/local/app/webapp-1.0",
          owner => 'appuser',
          group => 'appuser',
          require => Exec['Extract webapp'],
        }
}
