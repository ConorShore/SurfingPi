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
echo "Leave these empty if you want to reuse your previous credentials"
echo "These should be the long random looking username and password from the surfshark manual setup section"
echo "go to https://my.surfshark.com/vpn/manual-setup/router to get these"
echo

read -p "username:" user_var
read -p "password:" pass_var

if [ -z "$user_var" ]
then
      echo "Leave user and pass the same"
else
      echo "Updating user and pass"
      mkdir /home/$USER/.surfshark/
      echo $user_var > /home/$USER/.surfshark/surf
      echo $pass_var >> /home/$USER/.surfshark/surf
fi

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

echo "#!/bin/bash" > /usr/bin/surfstart.sh
echo "sudo openvpn /etc/openvpn/$tcpendpoint" >> surfstart
echo "surfstart created!"
echo "Adding to /usr/bin/"
echo
sudo cp surfstart /usr/bin/surfstart
rm surfstart
sudo chmod +x /usr/bin/surfstart
break
done

break
;;
UDP)
udpendpoints=$(ls /etc/openvpn/ | grep udp)
select udpendpoint in $udpendpoints
do
echo "$udpendpoint endpoint selected"
echo "#!/bin/bash" > /usr/bin/surfstart.sh
echo "sudo openvpn /etc/openvpn/$udpendpoint" >> surfstart
echo "Adding to /usr/bin"
echo
sudo cp surfstart /usr/bin/surfstart
rm surfstart
sudo chmod +x /usr/bin/surfstart
echo "surfstart.sh created!"
break
done

break
;;
esac
break
done

