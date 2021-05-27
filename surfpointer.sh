#!/bin/bash
echo "SurfingPi, a Surfshark VPN Raspberry Pi helper by Conor Shore 2021"

if [ "$#" -gt 0 ]; then

    key="$1"

    case $key in
    -u | --uninstall)
        echo "Uninstalling"
        /opt/SurfingPi/uninstall.sh
        exit
        ;;
    -c | --configure)
        echo "Configuring"
        /opt/SurfingPi/configure.sh
        exit
        ;;
    -r | --reload)
        echo "Reloading configs"
        /opt/SurfingPi/update_surf_conf.sh
        exit
        ;;
    start)
        echo "SurfingPi service started"
        sudo systemctl start SurfingPi.service
        exit
        ;;
    stop)
        echo "SurfingPi service stopped"
        sudo systemctl stop SurfingPi.service
        exit
        ;;
    *) # unknown option
        echo "Unknown Option"
        echo
        echo "Available Options:"
        echo "-u | --uninstall  will remove SurfingPi"
        echo "-c | --configure  will let you configure SurfingPi"
        echo "-r | --reload     will redownload the vpn configs from surfshark"
        echo "start             will start the vpn connection"
        echo "stop              will stop the vpn connection"
        exit
        ;;
    esac

fi

