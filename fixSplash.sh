#!/bin/sh

## Replace Jivelite splash screen with resized version

cd /opt/jivelite/share/jive/jive
sudo rm splash.png
sudo ln -s /mnt/mmcblk0p2/tce/jive-mods/splash.png splash.png

