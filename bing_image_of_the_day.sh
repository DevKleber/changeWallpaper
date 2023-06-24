#!/bin/bash

caminho="/home/kleber/shellscripts/changeWallpaper"
page="https://www.bing.com"

curl -s "$page/?cc=br" > pagina.html

description=$(grep -o 'Description":"[^"]*' pagina.html | sed 's/Description":"//')

media_contents=$(grep -o 'MediaContents":\[{[^}]*}' pagina.html | sed 's/MediaContents"://')
title=$(grep -o 'Title":"[^"]*' pagina.html | sed 's/Title":"//' | sed 's/Pesquise com a sua voz!$//')

echo "$media_contents},\"titlePage\": \"$title\"}]" > media_contents.json

description=$(grep -o 'Description":"[^"]*' media_contents.json | sed 's/Description":"//')
urlImage=$(grep -o 'Url":"[^"]*' media_contents.json | sed 's/Url":"//')
wallpaper=$(grep -o 'Wallpaper":"[^"]*' media_contents.json | sed 's/Wallpaper":"//')


nome_imagem=$(basename "$urlImage")
extensao=$(echo "$nome_imagem" | awk -F . '{print $NF}')

wget "$page$urlImage" -O "${caminho}/bing.$extensao"

echo "Descrição: $description"
echo "Wallpaper: $wallpaper"
echo "Url: $urlImage"
echo "Título: $title"