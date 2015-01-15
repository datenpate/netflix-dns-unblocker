class apps::haproxy {
	exec { 'add haproxy repo':
		command => 'apt-add-repository ppa:vbernat/haproxy-1.5',
		path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
		require => [Class["base::apt-get-update"], Package["software-properties-common"], Exec["configure locale"]],
	}

	exec { "apt-get update2" :
		command => "/usr/bin/apt-get update",
	}

	package { "haproxy" :
		ensure => installed,
		require => [Exec["add haproxy repo"], Exec["apt-get update2"]],
	}

	exec { 'enable haproxy':
		command => "sed -i /etc/default/haproxy -e 's/ENABLED=0/ENABLED=1/'",
		path => '/bin',
		require => Package["haproxy"],
	}
}