# SurfingPi
Helper scripts for setting up and using SurfShark with a Raspberry Pi

## Setup
Open a terminal window and run this command. 

    curl -sL https://raw.githubusercontent.com/ConorShore/SurfingPi/main/install.sh | bash

Then run configure script with:
  
    /opt/SurfingPi/configure.sh
   
This will walk you through getting your credentials, selecting which vpn endpoint you want and automates downloading of the configs.
Once this is done, your credentials will be stored in ~/.surfshark/surf

This config process will generate a file called surfstart in /usr/bin. This is what you will use to connect to the VPN. 

## Usage

To connect to the VPN, simply run this command

    surfstart
  
This will connect you with the configurations you entered when you ran ./configure.sh

To, for example, change which location you want to connect to, just run the config script again

If you're having trouble connecting, try running

    /opt/SurfingPi/update_surf_conf.sh
   
From the SurfingPi folder, sometimes an update is required before you can connect to the VPN

## Uninstall

Run the included uninstall script when cd into the SurfingPi folder with:

    /opt/SurfingPi/uninstall.sh
