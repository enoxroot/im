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
	save_page_as 'https://www.ebay.com/sch/i.html?&_nkw='"$i"\
		--load-wait-time $(( ( RANDOM % 4 )  + 5 ))\
		--save-wait-time $(( ( RANDOM % 4 )  + 5 ))\
		--destination "./$i.ebay.html"
	rm -r *_files
done < "$list"
