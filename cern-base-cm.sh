#!/bin/sh

# Disable firewall
systemctl disable firewalld
systemctl stop firewalld

# Disable selinux
sed -i 's/enforcing/disabled/' /etc/selinux/config

# Remove cern puppet
rpm -e puppet*

# Install puppet
rpm -Uvh http://yum.puppet.com/puppet5-release-el-7.noarch.rpm
yum install --disablerepo=cern puppetserver -y
yum install --disablerepo=cern puppet-agent -y

