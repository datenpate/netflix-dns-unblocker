# howto
# cd /root
# git clone ...
# install puppet
# FACTER_PASSWORD=secret
# sudo puppet apply --modulepath ./modules manifests/site.pp

node default {
	include base::apt-get-update

	include base:cleanup

	include base::git
	include base::misc

	include apps::php5
	include apps::haproxy

	include unblocker::unblocker


	# php genconf.php pure-sni
	# copy to /etc/haproxy
	# restart haproxy

	# mail/download dnsmasq file

}
