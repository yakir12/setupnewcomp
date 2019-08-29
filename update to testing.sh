#!/bin/bash

# upgrade stable to tesing
mv /etc/apt/sources.list /etc/apt/sources.list.old
cp ~/setupnewcomp/sources.list /etc/apt/

# update system
apt-get update 
apt-get -y dist-upgrade 
apt-get -y autoremove 
reboot
