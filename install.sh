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
sudo git clone https://github.com/ConorShore/SurfingPi.git

sudo cp /opt/SurfingPi/surfpointer.sh /usr/bin/surfstart
sudo chmod +x /usr/bin/surfstart


