#!/bin/sh

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