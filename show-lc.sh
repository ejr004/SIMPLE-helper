#!/bin/sh

echo "uninstalling SIMPLE GRID module"
puppet module uninstall --ignore-changes maany-simple_grid

echo "Removing etc simple_grid dir"
rm -rf /etc/simple_grid/

echo "Leaving swarm network"
docker swarm leave --force
[root@h-lc-01 helper]# cat show_simple.sh 
#/bin/sh

echo -e "\n"
echo  "---------"
echo  ".stage"
echo  "---------"
more /etc/simple_grid/.stage

echo -e "\n"
echo  "---------"
echo "swarm"
echo  "---------"
docker node ls

echo -e "\n"
echo  "---------"
echo  "container"
echo  "---------"
docker ps -a