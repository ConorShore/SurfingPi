cd /etc/openvpn
sudo rm *
sudo wget https://my.surfshark.com/vpn/api/v1/server/configurations
sudo unzip configurations
sudo rm configurations
echo "Modifiying configs to use userpass file"

sudo grep -rl "auth-user-pass" /etc/openvpn/ | sudo xargs sed -i "s>auth-user-pass>auth-user-pass /home/$USER/.surfshark/surf>g"
echo "done"
echo
