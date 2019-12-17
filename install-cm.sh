#!/bin/sh

read -p "Enter with the Puppet Forge Server fqdn and press enter:   "  pfs_fqdn

echo "Installing SIMPLE GRID module"
puppet module install --module_repository=http://$pfs_fqdn maany-simple_grid

echo "Creating sample site-level-config file and dir"
puppet apply -e 'class{"simple_grid::install::config_master::simple_installer::create_sample_site_level_config_file":}'

read -p "XXXX Press enter to continue: XXXX"

echo "Coping site_level_config_file.yaml"
cp /root/site_level_config_file.yaml   /etc/simple_grid/site_config/

echo "Coping dummy scripts"
cp -r /root/SIMPLE-helper/lifecycle/ /etc/simple_grid/

echo "Running SIMPLE GRID install stage"
puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e 'class{"simple_grid::install::config_master::simple_installer":}'

# wget -O - https://raw.githubusercontent.com/ejr004/SIMPLE-helper/master/install-cm.sh |bash