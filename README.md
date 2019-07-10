# SIMPLE-helper

Step 1. Install the Puppet Forge Server module: 

```
puppet module install unibet-forge_server

puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e 'class { '::forge_server':
provider => 'puppet_gem',
} 

```

Don't forget to change localhost to fqdn and the port to 80
```
sed -i 's/localhost/<yourserver-fqdn>/' /etc/systemd/system/puppet-forge-server.service
sed -i 's/8080/80/' /etc/systemd/system/puppet-forge-server.service

systemctl daemon-reload
systemctl start puppet-forge-server.service

Step 2. Clone this repo and have fun
```

yum install git -y
git clone https://github.com/ejr004/SIMPLE-helper.git
```
