#!/bin/sh

## Hack to fix Clock Applet

cd /opt/jivelite/share/jive/applets/Clock
sudo rm ClockApplet.lua
sudo ln -s /home/tc/ClockApplet.lua ClockApplet.lua

# Resized Analog clock background
cd /opt/jivelite/share/jive/applets/Wav35Skin/images/Clocks/Analog
sudo rm wallpaper_clock_analog.png
sudo ln -s /mnt/mmcblk0p2/tce/jive-mods/wallpaper_clock_analog.png wallpaper_clock_analog.png

# Resized Digital clock background
cd /opt/jivelite/share/jive/applets/Wav35Skin/images/Clocks/Digital
sudo rm wallpaper_clock_digital.png
sudo ln -s /mnt/mmcblk0p2/tce/jive-mods/wallpaper_clock_digital.png wallpaper_clock_digital.png
