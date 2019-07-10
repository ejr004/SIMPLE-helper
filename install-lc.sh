#!/bin/sh

read -p "Enter with the Puppet Forge Server fqdn and press enter:   "  pfs_fqdn

echo "Installing SIMPLE GRID module"
puppet module install --module_repository=http://$pfs_fqdn maany-simple_grid

echo "Adding module repository: http://$pfs_fqdn"
sed -i "1imodule_repository = http://$pfs_fqdn" /etc/puppetlabs/puppet/puppet.conf 
sed -i "1i[main]" /etc/puppetlabs/puppet/puppet.conf 

read -p "Enter with the Puppet Server fqdn and press enter:   "  cm_fqdn
echo "Running puppet apply with $cm_fqdn as puppet server"

puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules -e "class {'simple_grid::install::lightweight_component::simple_installer':puppet_master => '$cm_qdn'}"

echo -e "Now sign the certificates for the CM: \n puppet cert sign --all"