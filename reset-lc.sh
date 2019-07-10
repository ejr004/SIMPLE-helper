#!/bin/sh

echo "uninstalling SIMPLE GRID module"
puppet module uninstall --ignore-changes maany-simple_grid

echo "Removing etc simple_grid dir"
rm -rf /etc/simple_grid/

echo "Leaving swarm network"
docker swarm leave --force