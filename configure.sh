#!/bin/bash
echo "SurfingPi Configure"
echo
read -n1 -p "Do you want to update surfshark configs first? [y,n]  " doit
case $doit in  
  y|Y) echo "Updating configs"  
  	./update_surf_conf.sh ;;
  n|N) echo "Skipping update" ;; 
  *) echo "Please answer y or n" ;; 
esac
echo
echo "Surfshark Credentials"
echo "These should be the long random looking username and password from the surfshark manual setup section"
echo "go to https://my.surfshark.com/vpn/manual-setup/router to get these"
echo
read -p "username:" user_var
read -p "password:" pass_var

echo $user_var > /home/$USER/surf
echo $pass_var >> /home/$USER/surf
echo 
echo "Select which protocol to use"
select proto in TCP UDP
do
echo "$proto selected"

case $proto in
	TCP)
tcpendpoints=$(ls /etc/openvpn/ | grep tcp)
select tcpendpoint in $tcpendpoints
do
echo "$tcpendpoint endpoint selected"
break
done

break
;;
UDP)
udpendpoints=$(ls /etc/openvpn/ | grep udp)
select udpendpoint in $udpendpoints
do
echo "$udpendpoint endpoint selected"
break
done

break
;;
esac
break
done

