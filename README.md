# SurfingPi
Helper scripts for setting up and using SurfShark with a Raspberry Pi

## Setup
Clone this repo and cd into the directory with these two commands:

    git clone git@github.com:ConorShore/SurfingPi.git
    cd SurfingPi

Then run configure script with:
  
    ./configure.sh
   
This will walk you through getting your credentials, selecting which vpn endpoint you want and automates downloading of the configs.
Once this is done, your credentials will be stored in ~/.surfshark/surf

This config process will generate a file called surfstart in /usr/bin. This is what you will use to connect to the VPN. 

## Usage

To connect to the VPN, simply run this command

    surfstart
  
This will connect you with the configurations you entered when you ran ./configure.sh

To, for example, change which location you want to connect to, just run the config script again

If you're having trouble connecting, try running

    ./update_surf_conf.sh
   
From the SurfingPi folder, sometimes an update is required before you can connect to the VPN

## Uninstall

Run the included uninstall script when cd into the SurfingPi folder with:

    ./uninstall
