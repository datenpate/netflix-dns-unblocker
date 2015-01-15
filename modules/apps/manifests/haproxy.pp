class apps::haproxy {
	package { "haproxy" :
		ensure => installed,
		require => [Class["base::apt-get-update"], Exec["configure locale"]],
	}

	exec { 'enable haproxy':
		command      => "sed -i /etc/default/haproxy -e 's/ENABLED=0/ENABLED=1/'",
		path        => '/bin',
		require    => Package["haproxy"],
	}
}