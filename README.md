only tested on ubuntu 14.04!

installs an dns unblocker like described on https://github.com/trick77/tunlr-style-dns-unblocking

Caution: it's not recommended but it's possible to run a (recursive) DNS forwarder on your server. If you leave the DNS port wide open to everyone, your server will get terminated sooner or later because of abuse (DDoS amplification attacks). This installation is not secure against any misuse and should only used as prove of concept. 

```bash
cd /root
git clone https://github.com/datenpate/netflix-dns-unblocker.git
apt-get install puppet
export FACTER_monitor_password=yoursupersecretpassword
puppet apply --modulepath /root/netflix-dns-unblocker/modules /root/netflix-dns-unblocker/init.pp
```
see your stats on http://yourserver:27199 (haproxy:yoursupersecretpassword)
