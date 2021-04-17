#!/bin/bash
echo "SurfingPi Configure"
echo
echo "SurfShark Credentials"
echo "These should be the long random looking username and password from the surfshark manual setup section"
echo "go to https://my.surfshark.com/vpn/manual-setup/router to get these"
echo
read -p "username:" user_var
read -p "password:" pass_var

echo $user_var > /home/$USER/surf
echo $pass_var >> /home/$USER/surf
