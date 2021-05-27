#!/bin/bash

#Get all the required packages
PREREQ_PACKAGES="curl unzip openvpn git"
PREREQ_PACKAGES_TO_INSTALL=
for package in $PREREQ_PACKAGES; do
    if ! dpkg-query --show --showformat='${db:Status-Status}\n' "$package" 2> /dev/null | grep -q '^installed$'; then
        PREREQ_PACKAGES_TO_INSTALL="$package $PREREQ_PACKAGES_TO_INSTALL"
    fi
done

if [ "$PREREQ_PACKAGES_TO_INSTALL" ]; then
    sudo apt update
    sudo apt -y install $PREREQ_PACKAGES_TO_INSTALL
fi



cd /opt/

echo "cleaning old versions"
sudo rm -r ~/.surfshark/
#remove old versions
sudo rm /usr/bin/surfstart

sudo rm -r /opt/SurfingPi/
sudo rm /usr/bin/SurfingPi

sudo systemctl stop SurfingPi.service
sudo rm /etc/systemd/system/SurfingPi.service
sudo systemctl daemon-reload
ls /etc/openvpn/ | grep surfshark | xargs -Ihere sudo rm /etc/openvpn/here

sudo git clone https://github.com/ConorShore/SurfingPi.git



sudo cp /opt/SurfingPi/surfpointer.sh /usr/bin/SurfingPi

sudo cp /opt/SurfingPi/SurfingPi.service /etc/systemd/system/SurfingPi.service
sudo chmod 644 /etc/systemd/system/SurfingPi.service
sudo systemctl daemon-reload

sudo chmod +x /usr/bin/SurfingPi
SurfingPi -c


