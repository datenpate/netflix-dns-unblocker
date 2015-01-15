class base::apt-get-update {
	exec { "apt-get update" :
		command => "/usr/bin/apt-get update",
	}
}
