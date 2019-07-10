#!/bin/sh

echo "Installing SIMPLE puppet module"
puppet module install --module_repository=http://lc-02.cern.ch maany-simple_grid

echo "Creating sample site-level-config file and dir"
puppet apply -e 'class{"simple_grid::install::config_master::simple_installer::create_sample_site_level_config_file":}'

read -p "XXXX Press enter to continue: XXXX"
echo "Coping site_level_config_file.yaml"
cp /root/site-level-config.yaml /etc/simple_grid/site_config/
cp -r /root/SIMPLE-helper/lifecycle/ /etc/simple_grid/

echo "Running SIMPLE GRID install stage"
puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e 'class{"simple_grid::install::config_master::simple_installer":}'

echo "Now run /root/SIMPLE-helper/./install-LC.ch on each LC \n
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"