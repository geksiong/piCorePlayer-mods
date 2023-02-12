#!/bin/sh

# Replace Jivelite fonts with Unicode fonts

cd /opt/jivelite/share/jive/fonts
sudo rm FreeSans.ttf
sudo rm FreeSansBold.ttf
sudo ln -s /mnt/mmcblk0p2/tce/fonts/HarmonyOS_Sans_SC_Regular.ttf FreeSans.ttf
sudo ln -s /mnt/mmcblk0p2/tce/fonts/HarmonyOS_Sans_SC_Bold.ttf FreeSansBold.ttf

