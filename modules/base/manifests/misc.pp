class base::misc {
	package { "htop" :
		ensure => installed,
	}

	exec { 'generate locale':
		command => 'locale-gen de_DE.UTF-8',
		path => '/usr/sbin',
		refreshonly => true,
	}

	exec { 'configure locale':
		command => 'dpkg-reconfigure locales',
		path => '/usr/sbin',
		refreshonly => true,
		require => Exec["generate locale"],
	}
}