class base::apt-get-update {
	exec { "apt-get update" :
		command => "/usr/bin/apt-get update",
	}

	package { 'software-properties-common':
		ensure => installed,
		require => Exec["apt-get update"],
	}
}
