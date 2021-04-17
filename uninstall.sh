#!/bin/bash
cd ..
sudo rm -r ~/.surfshark/
sudo rm -r ~/SurfingPi/
sudo rm /usr/bin/surfstart
ls /etc/openvpn/ | grep surfshark | xargs -Ihere sudo rm /etc/openvpn/here
echo "All removed"
