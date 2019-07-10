#!/bin/sh

echo "Rollback stages"
puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e 'class{"simple_grid::deploy::config_master::rollback":}'
puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e 'class{"simple_grid::pre_deploy::config_master::rollback":}'

echo "Uninstalling simple grid module"
puppet module uninstall --ignore-changes maany-simple_grid

echo "Removing etc simple_grid dir" 
/bin/rm -rf /etc/simple_grid/

echo "Removing simple environment"
/bin/rm -rf /etc/puppetlabs/code/environments/simple/

echo "Removing Puppet bolt config file and package"
/bin/yum remove puppet-bolt -y
/bin/rm -rf /root/.puppetlabs/

echo "Restarting puppetserver and puppet services"

systemctl restart puppetserver
systemctl restart puppet