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
echo "################# Decreasing swappiness value"
echo "######################################################################################################"
tput sgr0
echo

# ### To display swappiness value
# cat /proc/sys/vm/swappiness

echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.d/99-swappiness.conf
### or (works on manjaro)
#echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.d/100-manjaro.conf

sudo systemctl restart systemd-sysctl.service

echo
tput setaf 2
echo "######################################################################################################"
echo "################# New swappiness value set"
echo "######################################################################################################"
tput sgr0
echo
