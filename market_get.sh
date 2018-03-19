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
	save_page_as 'https://market.yandex.ru/search.xml?text='"$i"\
		--load-wait-time $(( ( RANDOM % 5 )  + 6 ))\
		--save-wait-time $(( ( RANDOM % 5 )  + 6 ))\
		--destination "./$i.market.html"
	rm -r *_files
done < "$list"

