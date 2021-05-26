#!/bin/bash
echo "SurfingPi, a Surfshark VPN Raspberry Pi helper by Conor Shore 2021"

if [ "$#" -gt 0 ] then

    key="$1"

    case $key in
    -u | --uninstall)
        /opt/SurfingPi/uninstall.sh
        exit
        ;;
    -c | --configure)
        /opt/SurfingPi/configure.sh
        exit
        ;;
    -l | --reload)
        /opt/SurfingPi/update_surf_conf.sh
        exit
        ;;
    *) # unknown option
        echo "Unknown Option"
        echo "-u | --uninstall  will remove SurfingPi"
        echo "-c | --configure  will let you configure SurfingPi"
        echo "-l | --reload     will redownload the vpn configs from surfsharl"
        ;;
    esac

fi

sudo /opt/SurfingPi/surfstart
