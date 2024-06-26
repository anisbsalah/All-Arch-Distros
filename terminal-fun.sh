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
echo "################# Installing reporting tools..."
echo "######################################################################################################"
tput sgr0
echo

### Installing pfetch
# sudo pacman -S --noconfirm --needed git
# git clone https://github.com/dylanaraps/pfetch.git /tmp/pfetch
# cd /tmp/pfetch || exit 1
# sudo install pfetch /usr/local/bin/
# ls -l /usr/local/bin/pfetch

sudo pacman -S --noconfirm --needed lsb-release wmctrl
echo
tput setaf 5
echo " [*] Installing alsi..."
tput sgr0
sudo pacman -S --noconfirm --needed alsi
tput setaf 5
echo " [*] Installing neofetch..."
tput sgr0
sudo pacman -S --noconfirm --needed neofetch
tput setaf 5
echo " [*] Installing shell-color-scripts..."
tput sgr0
sudo pacman -S --noconfirm --needed shell-color-scripts

TOOLS_DIR="${CURRENT_DIR}/Personal/bin/terminal-fun"

# Check if the directory exists
if [[ -d ${TOOLS_DIR} ]]; then
	# Loop through each file in the directory
	for FILE in "${TOOLS_DIR}"/*; do
		if [[ -f ${FILE} ]]; then
			TOOL=$(basename "${FILE}")
			tput setaf 5
			echo " [*] Installing ${TOOL}..."
			tput sgr0
			sudo cp -v "${FILE}" /usr/local/bin/
		fi
	done
else
	echo "Directory '${TOOLS_DIR}' does not exist."
	exit 1
fi

[[ -f "${HOME}/.bashrc" ]] && cp -an "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
if ! grep -q '### reporting tools - install when not installed' "${HOME}/.bashrc" &>/dev/null; then
	echo '
### reporting tools - install when not installed
# alsi
# fetch
# hfetch
# neofetch
# paleofetch
# pfetch
# screenfetch
# sfetch
# ufetch
# sysinfo
# sysinfo-retro
# colorscript random' | tee -a "${HOME}/.bashrc"
fi

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Enjoy!"
echo "######################################################################################################"
tput sgr0
echo
