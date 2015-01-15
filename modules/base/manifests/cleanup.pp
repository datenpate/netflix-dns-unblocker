class base::cleanup {
	package { ["apache2", "mysql"] :
		ensure => absent,
	}
}