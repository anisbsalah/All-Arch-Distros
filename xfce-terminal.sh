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
echo "################# Installing themes for Xfce terminal..."
echo "######################################################################################################"
tput sgr0
echo

[[ -d "$HOME/.local/share/xfce4/terminal/colorschemes" ]] || mkdir -p "$HOME/.local/share/xfce4/terminal/colorschemes"
cp "$CURRENT_DIR/Personal/settings/terminal-themes/xfce-terminal/"* "$HOME/.local/share/xfce4/terminal/colorschemes"

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Done"
echo "######################################################################################################"
tput sgr0
echo
