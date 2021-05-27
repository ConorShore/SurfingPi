#!/bin/bash
echo "SurfingPi Configure"
echo
doit=h
if [[ $(ls /etc/openvpn | grep surfshark) ]] ; then
      $doit=y
else
      read -n1 -p "Do you want to update surfshark configs first? [y,n]  " doit
fi
echo
echo $doit
echo
case $doit in
y | Y)
      echo "Updating configs"
      cd /etc/openvpn
      sudo rm *
      sudo wget https://my.surfshark.com/vpn/api/v1/server/configurations
      sudo unzip configurations >/dev/null
      sudo rm configurations >/dev/null
      echo "Modifiying configs to use userpass file"

      sudo grep -rl "auth-user-pass" /etc/openvpn/ | sudo xargs sed -i "s>auth-user-pass>auth-user-pass /home/$USER/.surfshark/surf>g"
      echo "done"
      echo
      ;;
n | N) echo "Skipping update" ;;
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

if [ -z "$user_var" ] ; then
      echo "Leave user and pass the same"
else
      echo "Updating user and pass"
      sudo rm /home/$USER/.surfshark/surf
      mkdir /home/$USER/.surfshark/
      sudo echo $user_var >/home/$USER/.surfshark/surf
      sudo echo $pass_var >>/home/$USER/.surfshark/surf
      sudo chmod -R 600 /home/$USER/.surfshark
fi

echo

echo "Select which protocol to use"
select proto in TCP UDP; do
      echo "$proto selected"

      case $proto in
      TCP)
            tcpendpoints=$(ls /etc/openvpn/ | grep tcp)
            select tcpendpoint in $tcpendpoints; do
                  echo "$tcpendpoint endpoint selected"
                  sudo chmod -R 777 /opt/SurfingPi
                  sudo echo "#!/bin/bash" >/opt/SurfingPi/surfstart
                  sudo echo "sudo openvpn /etc/openvpn/$tcpendpoint" >>/opt/SurfingPi/surfstart
                  echo "Adding to /usr/bin/"
                  echo
                  sudo chmod +x /opt/SurfingPi/surfstart
                  echo "surfstart created!"
                  sudo chmod -R 755 /opt/SurfingPi
                  break
            done

            break
            ;;
      UDP)
            udpendpoints=$(ls /etc/openvpn/ | grep udp)
            select udpendpoint in $udpendpoints; do
                  echo "$udpendpoint endpoint selected"
                  sudo chmod -R 777 /opt/SurfingPi
                  echo "#!/bin/bash" >/opt/SurfingPi/surfstart
                  echo "sudo openvpn /etc/openvpn/$udpendpoint" >>/opt/SurfingPi/surfstart
                  echo "Adding to /usr/bin"
                  echo
                  sudo chmod +x /opt/SurfingPi/surfstart
                  echo "surfstart created!"
                  sudo chmod -R 755 /opt/SurfingPi
                  break
            done

            break
            ;;
      esac
      break
done
