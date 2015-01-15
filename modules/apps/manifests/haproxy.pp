class apps::haproxy {
	package { "haproxy" :
		ensure => installed,
	}

	exec { 'enable haproxy':
		command      => "sed -i /etc/default/haproxy -e 's/ENABLED=0/ENABLED=1/'",
		path        => '/bin',
		require    => Package["haproxy"],
	}

	service { 'haproxy':
		enable      => true,
		ensure      => running,
		hasrestart => true,
		hasstatus  => true,
		require    => Package["haproxy"],
	}
}