#!/bin/sh

name=$(printf "%s" "$*" |sed 's/ /\%20/g')
curl -s -o url.html https://thepiratebay.party/search/$name/1/99/200
	magnet=$(cat url.html|grep -E 'magnet\:\?'|sed 's/href\=/ /g'|awk '{print $2}'|sed 's/"/ /g'| head -n 1|sed 's/ //g')
webtorrent "$magnet" --mpv
