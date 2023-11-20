#!/bin/bash
#set -e
##################################################################################################################
# Author  :  anisbsalah
# Github  :  https://github.com/anisbsalah
##################################################################################################################
#
# DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
CURRENT_DIR="$(pwd)"
##################################################################################################################

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing Samba with easy configuration..."
echo "######################################################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed samba

echo

[[ ! -f /etc/samba/smb.conf ]] || sudo cp -anv /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo cp "${CURRENT_DIR}/config/"* /etc/samba/
### Get the arcolinux samba config file from the web:
sudo wget "https://raw.githubusercontent.com/arcolinux/arcolinux-system-config/master/etc/samba/smb.conf.arcolinux" -O /etc/samba/smb.conf.arcolinux
echo
[[ -d "${HOME}/SHARED" ]] || mkdir -p "${HOME}/SHARED"
### Choose easy configuration
sudo cp -fv /etc/samba/smb.conf.easy /etc/samba/smb.conf

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Create a password for the current user to be able to access Samba server"
echo "######################################################################################################"
echo
tput sgr0

#read -erp "What is your login? It will be used to add this user to smb : " choice
#sudo smbpasswd -a "${choice}"

sudo smbpasswd -a "${USER}"

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Enabling services"
echo "######################################################################################################"
echo
tput sgr0

sudo systemctl enable --now smb.service
sudo systemctl enable --now nmb.service

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Network Discovery"
echo "######################################################################################################"
echo
tput sgr0

sudo pacman -S --noconfirm --needed avahi
sudo systemctl enable --now avahi-daemon.service

#shares on a linux
sudo pacman -S --noconfirm --needed gvfs-smb

#shares on a mac
sudo pacman -S --noconfirm --needed nss-mdns

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Configuring the firewall service"
echo "######################################################################################################"
echo
tput sgr0

if pacman -Qi firewalld &>/dev/null; then
	sudo firewall-cmd --set-default-zone=home
	sudo firewall-cmd --permanent --add-service={samba,samba-client,samba-dc,ssh,ws-discovery,ws-discovery-client,ws-discovery-tcp,ws-discovery-udp,ipp,ipp-client} --zone=home

elif pacman -Qi ufw &>/dev/null; then
	sudo ufw allow CIFS

else
	tput setaf 11
	echo "########################################"
	echo " No firewall installed"
	echo "########################################"
	echo
	tput sgr0
fi

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Samba has been installed"
echo "################# Now reboot before sharing folders!"
echo "######################################################################################################"
tput sgr0
echo
