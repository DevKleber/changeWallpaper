#!/bin/bash

DIR="/home/kleber/Pictures/wallpapers/wallpapers/paisagens/"
PIC=$(ls $DIR/* | shuf -n1)
echo "file:///$PIC"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///$PIC"