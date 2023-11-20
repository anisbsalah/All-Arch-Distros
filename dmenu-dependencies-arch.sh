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
tput setaf 3
echo "######################################################################################################"
echo "################# Installing dmenu dependencies..."
echo "######################################################################################################"
tput sgr0
echo

sudo pacman -S --needed --noconfirm libx11 libxft libxinerama

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Packages have been installed"
echo "######################################################################################################"
tput sgr0
echo
