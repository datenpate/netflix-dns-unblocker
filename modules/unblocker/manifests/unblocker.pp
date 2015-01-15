class unblocker::unblocker {
	exec { 'clone unblocker':
		command      => 'git clone https://github.com/datenpate/tunlr-style-dns-unblocking.git',
		path         => '/usr/bin',
		cwd			 => '/root',
		require		 => Package['git']
	}

	exec { 'set ip':
		command      => "sed -i /root/tunlr-style-dns-unblocking/config.json -e 's/199.233.245.62/${ipaddress}/'",
		path        => '/bin',
		require    => Exec["clone unblocker"],
	}

	exec { 'set password':
		command      => "sed -i /root/tunlr-style-dns-unblocking/config.json -e 's/Change-Me-Now/${monitor_password}/'",
		path        => '/bin',
		require    => Exec["clone unblocker"],
	}
}