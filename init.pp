# howto
# cd /root
# git clone https://github.com/datenpate/netflix-dns-unblocker.git
# apt-get install puppet
# export FACTER_monitor_password=secret
# sudo puppet apply --modulepath /root/netflix-dns-unblocker/modules /root/netflix-dns-unblocker/init.pp

node default {
	include base::apt-get-update

	include base::cleanup

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
