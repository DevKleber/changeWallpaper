#!/bin/bash

# aleatorio=$(($RANDOM%1000))
# aleatorio=""
aleatorio=$(date +%d%m%Y)
nameImage="wallpaper$aleatorio.jpg"

# export DBUS_SESSION_BUS_ADDRESS environment variable
PID=$(pgrep -o "cinnamon-sess|gnome-sess|mate-sess")
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

wget -O /tmp/$nameImage "http://www.bing.com/$(wget -q -O- https://binged.it/2ZButYc | sed -e 's/<[^>]*>//g' | cut -d / -f2 | cut -d \& -f1)"

# gsettings set org.gnome.desktop.background picture-uri "file:///tmp/$nameImage"
# gsettings set org.gnome.desktop.background picture-uri "file:///tmp/$nameImage"

# Windows
# Move file to windows folder. 
cp /tmp/$nameImage /mnt/c/Users/KleberdeSouzadasChag\/Pictures\/Wallpaper\/wallpapers\/paisagens\/bing