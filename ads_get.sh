#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#

list=$1

if [ -z "$list" ]
then
	read list
fi

while read i
do
	save_page_as 'https://yandex.ru/search/ads?text='"$i"' купить'\
		--load-wait-time $(( ( RANDOM % 5 )  + 6 ))\
		--save-wait-time $(( ( RANDOM % 5 )  + 6 ))\
		--destination "./$i.ads.html"
	rm -r *_files
done < "$list"

