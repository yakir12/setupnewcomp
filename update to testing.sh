#!/bin/bash

## upgrade stable to tesing
sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
sudo cp ~/setupnewcomp/sources.list /etc/apt/

## update
sudo apt-get update 
sudo apt-get -y dist-upgrade 
sudo apt-get -y autoremove 
sudo reboot
