# SurfingPi
Helper scripts for setting up and using SurfShark with a Raspberry Pi

## Setup
### Easy
Open a terminal window and run this command. 

    curl -sL https://raw.githubusercontent.com/ConorShore/SurfingPi/main/install.sh | bash
    
### Long way
Pretty much just the script listed above

    sudo apt update
    sudo apt install -y curl unzip openvpn git
    cd /opt/
    sudo git clone https://github.com/ConorShore/SurfingPi.git
    
### Configuration

To reconfigure, run script with:
  
    surfstart -c
   
This is run automatically with the install script. This will walk you through getting your credentials, selecting which vpn endpoint you want and automates downloading of the configs.
Once this is done, your credentials will be stored in ~/.surfshark/surf

This config process will generate a file called surfstart in /usr/bin. This is what you will use to connect to the VPN.

## Usage

To connect to the VPN, simply run this command

    surfstart
  
This will connect you with the configurations you entered when you ran ./configure.sh

To, for example, change which location you want to connect to, just run the config script again

If you're having trouble connecting, try running

    surfstart -r
   
sometimes an update to vpn configs is required before you can connect to the VPN

## Uninstall

Run the included uninstall script with:

    surfstart -u
