#!/bin/sh

echo "Installing SIMPLE GRID module"
puppet module install --module_repository=http://lc-02.cern.ch maany-simple_grid

echo "Running SIMPLE GRID installer for LC
puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e "class {'simple_grid::install::lightweight_component::simple_installer':puppet_master => 'h-cm-01.cern.ch'}"
"




echo "Now sign the certificates on CM \n
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 Step 1.
      Add to /etc/puppetlabs/puppet/puppet.conf

      [main]
      module_repository = http://lc-02.cern.ch
 Step 2.
 puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e "class {'simple_grid::install::lightweight_component::simple_installer':puppet_master => 'basic_config_master.cern.ch'}"

Step 3.
      On CM:
      puppet cert sign --all"