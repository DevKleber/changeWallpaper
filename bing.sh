aleatorio=$(($RANDOM % 1000))
nameImage="wallpaper$aleatorio.jpg"

wget -O /tmp/$nameImage "http://www.bing.com/$(wget -q -O- https://binged.it/2ZButYc | sed -e 's/<[^>]*>//g' | cut -d / -f2 | cut -d \& -f1)"

gsettings set org.gnome.desktop.background picture-uri-dark "file:///tmp/$nameImage"
