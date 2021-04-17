# SurfingPi
Helper scripts for setting up and using SurfShark with a Raspberry Pi

## Setup
Clone this repo first
Then run configure script with:
  
    ./configure.sh
   
This will walk you through getting your credentials, selecting which vpn endpoint you want and automates downloading of the configs.
Once this is done, your credentials will be stored in ~/.surfshark/surf

This config process will generate a file called surfstart in /usr/bin. This is what you will use to connect to the VPN. 

## Using

To connect to the VPN, simply run this command

    surfstart
  
This will connect you with the configurations you entered when you ran ./configure.sh
