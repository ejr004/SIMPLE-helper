#!/bin/sh

# yum update
yum update -y

# Disable firewall
systemctl disable firewalld
systemctl stop firewalld

# Disable selinux
sed -i 's/enforcing/disabled/' /etc/selinux/config

# Install vim
yum install -y vim-enhanced 

# Remove cern puppet
yum remove puppet* -y

# Install puppet
rpm -Uvh http://yum.puppet.com/puppet5-release-el-7.noarch.rpm
yum install -y --disablerepo=cern puppetserver

echo "Puppet client version should be 5.5.14"
puppet --version

echo "Reboot is needed to update selinux"