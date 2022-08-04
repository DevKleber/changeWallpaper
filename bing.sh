wget -O /tmp/wallpaper.jpg "http://www.bing.com/$(wget -q -O- https://binged.it/2ZButYc | sed -e 's/<[^>]*>//g' | cut -d / -f2 | cut -d \& -f1)"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///tmp/wallpaper.jpg"
# gsettings set org.gnome.desktop.background picture-uri-dark "file:///$PIC"

# ou
# pega a url desse json e concatena com a url do bing: ex: http://www.bing.com/+urldojson
# https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US