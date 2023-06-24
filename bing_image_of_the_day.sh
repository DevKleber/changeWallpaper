#!/bin/bash


# Faça o download da página
curl -s "https://www.bing.com/?cc=br" > pagina.html

# Extrair a descrição
description=$(grep -o 'Description":"[^"]*' pagina.html | sed 's/Description":"//')

# Extrair o URL do wallpaper
wallpaper=$(grep -o 'Wallpaper":"[^"]*' pagina.html | sed 's/Wallpaper":"//')

# Extrair o título
title=$(grep -o 'Title":"[^"]*' pagina.html | sed 's/Title":"//' | sed 's/Pesquise com a sua voz!$//')

# # Imprimir os resultados
# echo "Descrição: $description"
# echo "Wallpaper: $wallpaper"
echo "Título: $title"

# Extrair o objeto completo MediaContents
media_contents=$(grep -o 'MediaContents":\[{[^}]*}' pagina.html)
echo "$media_contents}}]" > media_contents.json


description=$(grep -o 'Description":"[^"]*' media_contents.json | sed 's/Description":"//')
wallpaper=$(grep -o 'Wallpaper":"[^"]*' media_contents.json | sed 's/Wallpaper":"//')
title=$(grep -o 'Title":"[^"]*' media_contents.json | sed 's/Title":"//')


echo "Descrição: $description"
echo "Wallpaper: $wallpaper"
echo "Título: $title"