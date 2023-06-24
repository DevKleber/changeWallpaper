#!/bin/bash

curl -s "https://www.bing.com/?cc=br" > pagina.html

description=$(grep -o 'Description":"[^"]*' pagina.html | sed 's/Description":"//')

media_contents=$(grep -o 'MediaContents":\[{[^}]*}' pagina.html)
media_contents=$(grep -o 'MediaContents":\[{[^}]*}' pagina.html | sed 's/MediaContents"://')

echo "$media_contents}}]" > media_contents.json


description=$(grep -o 'Description":"[^"]*' media_contents.json | sed 's/Description":"//')
url=$(grep -o 'Url":"[^"]*' media_contents.json | sed 's/Url":"//')
wallpaper=$(grep -o 'Wallpaper":"[^"]*' media_contents.json | sed 's/Wallpaper":"//')
title=$(grep -o 'Title":"[^"]*' pagina.html | sed 's/Title":"//' | sed 's/Pesquise com a sua voz!$//')

caminho="/home/kleber/shellscripts/changeWallpaper"
nome_imagem=$(basename "$url")
extensao=$(echo "$nome_imagem" | awk -F . '{print $NF}')

wget "https://www.bing.com$url" -O "${caminho}/bing.$extensao"

echo "Descrição: $description"
echo "Wallpaper: $wallpaper"
echo "Url: $url"
echo "Título: $title"