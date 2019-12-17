#!/bin/bash

fallocate -l 160G /swapfile
chmod 600 /swapfile
mkswap /swapfile
dd if=/dev/zero of=/swapfile count=163840 bs=1MiB
swapon /swapfile
free -g

#wget -O - https://raw.githubusercontent.com/ejr004/SIMPLE-helper/master/cern-swap.sh|bash
