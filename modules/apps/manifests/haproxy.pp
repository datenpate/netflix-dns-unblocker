class apps::haproxy {
	exec { "apt-get update2" :
		command => "/usr/bin/apt-get update",
	}

	exec { 'add haproxy repo':
		command => 'apt-add-repository ppa:vbernat/haproxy-1.5',
		path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		require => [Exec["apt-get update2"], Package["software-properties-common"]],
	}

	package { "haproxy" :
		ensure => installed,
		require => [Class["base::apt-get-update"], Exec["configure locale"], Exec["add haproxy repo"]],
	}

	exec { 'enable haproxy':
		command => "sed -i /etc/default/haproxy -e 's/ENABLED=0/ENABLED=1/'",
		path => '/bin',
		require => Package["haproxy"],
	}
}