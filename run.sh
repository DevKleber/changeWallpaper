#!/bin/bash

DIR="/home/kleber/Pictures/wallpapers/wallpapers/paisagens/"
PIC=$(ls $DIR/* | shuf -n1)
# echo "file:///$PIC"

PID=$(pgrep -o "cinnamon-sess|gnome-sess|mate-sess")
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

gsettings set org.gnome.desktop.background picture-uri "file:///$PIC"