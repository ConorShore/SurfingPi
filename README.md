# SurfingPi
Helper scripts for setting up and using SurfShark with a Raspberry Pi. Sets up SurfShark as a service, so can run in the background.

## Setup
### Easy
Open a terminal window and run these command. 

    wget https://raw.githubusercontent.com/ConorShore/SurfingPi/main/install.sh
    chmod +x install.sh
    ./install.sh
    rm install.sh
    
## Usage

To connect to the VPN, simply run this command

    SurfingPi start
  
This will connect you with the configurations you entered when you ran ./configure.sh

To, for example, change which location you want to connect to, just run the config script again

If you're having trouble connecting, try running

    SurfingPi -r
   
sometimes an update to vpn configs is required before you can connect to the VPN

### Configuration

To reconfigure, run script with:
  
    SurfingPi -c
   
This is run automatically with the install script. This will walk you through getting your credentials, selecting which vpn endpoint you want and automates downloading of the configs.
Once this is done, your credentials will be stored in ~/.surfshark/surf

This config process will generate a file called surfstart in /usr/bin. This is what you will use to connect to the VPN.

## Uninstall

Run the included uninstall script with:

    SurfingPi -u
