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
echo "################# Installing codecs..."
echo "######################################################################################################"
tput sgr0
echo

sudo pacman -S --needed jasper lame libdca libdv gst-libav libtheora libvorbis libxv wavpack x264 xvidcore dvd+rw-tools dvdauthor dvgrab libmad libmpeg2 libdvdcss libdvdread libdvdnav exfatprogs a52dec faac faad2 flac gmtk

echo
tput setaf 2
echo "######################################################################################################"
echo "################# Codecs have been installed"
echo "######################################################################################################"
tput sgr0
echo
