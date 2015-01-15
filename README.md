```bash
cd /root
git clone https://github.com/datenpate/netflix-dns-unblocker.git
apt-get install puppet
export FACTER_monitor_password=yoursupersecretpassword
puppet apply --modulepath /root/netflix-dns-unblocker/modules /root/netflix-dns-unblocker/init.pp
```
see stats on http://yourserver:27199 (haproxy:yoursupersecretpassword)
