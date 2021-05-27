#!/bin/bash
sudo rm -r ~/.surfshark/
#remove old versions
sudo rm /usr/bin/surfstart

sudo rm -r /opt/SurfingPi/
sudo rm /usr/bin/SurfingPi

sudo systemctl stop SurfingPi.service
sudo rm /etc/systemd/system/SurfingPi.service
sudo systemctl daemon-reload
ls /etc/openvpn/ | grep surfshark | xargs -Ihere sudo rm /etc/openvpn/here
echo "All removed"
