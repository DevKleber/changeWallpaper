# aleatorio=$(($RANDOM%1000))
aleatorio=""
nameImage="wallpaper$aleatorio.jpg"

# export DBUS_SESSION_BUS_ADDRESS environment variable


wget -O /tmp/$nameImage "http://www.bing.com/$(wget -q -O- https://binged.it/2ZButYc | sed -e 's/<[^>]*>//g' | cut -d / -f2 | cut -d \& -f1)"

# gsettings set org.gnome.desktop.background picture-uri "file:///tmp/$nameImage"
DISPLAY=:0 GSETTINGS_BACKEND=dconf /usr/bin/gsettings set org.gnome.desktop.background picture-uri "file:///tmp/$nameImage"
