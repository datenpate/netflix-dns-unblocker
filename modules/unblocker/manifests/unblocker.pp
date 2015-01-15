class unblocker::unblocker {
	exec { 'clone unblocker':
		command => 'git clone https://github.com/datenpate/tunlr-style-dns-unblocking.git',
		path => '/usr/bin',
		cwd => '/root',
		require => [Package["git"], Class["base::cleanup"], Class["base::misc"]],
	}

	exec { 'set ip':
		command => "sed -i /root/tunlr-style-dns-unblocking/config.json -e 's/199.233.245.62/${ipaddress}/'",
		path => '/bin',
		require => Exec["clone unblocker"],
	}

	exec { 'set password':
		command => "sed -i /root/tunlr-style-dns-unblocking/config.json -e 's/Change-Me-Now/${monitor_password}/'",
		path => '/bin',
		require => Exec["clone unblocker"],
	}

	exec { 'create config':
		command => 'php genconf.php pure-sni',
		path => '/usr/bin',
		cwd => '/root/tunlr-style-dns-unblocking',
		require => [Package["php5-cli"], Exec["set ip"], Exec["set password"]],
	}

	file { '/etc/haproxy/haproxy.conf':
		ensure => present,
		source => '/root/tunlr-style-dns-unblocking/haproxy.conf',
		require => Exec["create config"],
	}

	service { 'haproxy':
		enable      => true,
		ensure      => running,
		hasrestart => true,
		hasstatus  => true,
		require    => [Package["haproxy"], File["/etc/haproxy/haproxy.conf"]],
	}
}