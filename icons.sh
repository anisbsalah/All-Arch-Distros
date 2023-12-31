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
# CURRENT_DIR="$(pwd)"
##################################################################################################################

echo
tput setaf 6
echo "######################################################################################################"
echo "ICONS"
echo "######################################################################################################"
tput sgr0

tput setaf 3
echo "######################################################################################################"
echo "################# Installing Papirus icon theme..."
echo "######################################################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed wget
wget -qO- https://git.io/papirus-icon-theme-install | sh

echo
echo "######################################################################################################"
echo "################# Installing hardcode-fixer..."
echo "######################################################################################################"
echo

sudo pacman -S --noconfirm --needed git
git clone https://github.com/Foggalong/hardcode-fixer.git /tmp/hardcode-fixer && cd /tmp/hardcode-fixer && sudo ./fix.sh

echo
echo "######################################################################################################"
echo "################# Installing hardcode-tray..."
echo "######################################################################################################"
echo

# ### From the AUR:
# sudo pacman -S base-devel
# paru -S hardcode-tray

### Manual installation
sudo pacman -S --needed --noconfirm base-devel gobject-introspection gtk3 librsvg python python-cairosvg python-gobject meson ninja imagemagick inkscape
git clone https://github.com/bil-elmoussaoui/Hardcode-Tray /tmp/Hardcode-Tray && cd /tmp/Hardcode-Tray && meson builddir --prefix=/usr
sudo ninja -C builddir install
echo
echo
sudo -E hardcode-tray
#sudo -E hardcode-tray --conversion-tool RSVGConvert --size 22 --theme Papirus-Dark

echo
echo "######################################################################################################"
echo "################# Installing papirus-folders..."
echo "######################################################################################################"

wget -qO- https://git.io/papirus-folders-install | sh

echo
echo "######################################################################################################"
echo "################# Available colors for Papirus-Dark folders"
echo "######################################################################################################"
echo

papirus-folders -l --theme Papirus-Dark

echo "Choose a color for papirus-folders:"
read -erp "#? " CHOICE
echo

papirus-folders -C "${CHOICE}" --theme Papirus-Dark

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Papirus icon theme has been installed"
echo "######################################################################################################"
tput sgr0
echo

echo
tput setaf 3
echo "######################################################################################################"
echo "################# Installing Candy icons..."
echo "######################################################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed git
git clone https://github.com/arcolinux/a-candy-beauty-icon-theme.git /tmp/candy
sudo cp -r /tmp/candy/usr/share/icons/* /usr/share/icons/

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Candy icons have been installed"
echo "######################################################################################################"
tput sgr0
echo
