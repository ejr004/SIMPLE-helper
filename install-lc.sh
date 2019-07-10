#!/bin/sh

echo "Installing SIMPLE GRID module"
puppet module install --module_repository=http://lc-02.cern.ch maany-simple_grid

echo "Running SIMPLE GRID installer for LC"
puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e "class {'simple_grid::install::lightweight_component::simple_installer':puppet_master => 'h-cm-01.cern.ch'}"


echo "Now sign the certificates on CM \n
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      Add to /etc/puppetlabs/puppet/puppet.conf

      [main]
      module_repository = http://lc-02.cern.ch

      On CM:
      puppet cert sign --all"