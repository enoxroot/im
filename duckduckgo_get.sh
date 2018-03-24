#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#

list=$1
opt=$2

while read i
do
	save_page_as 'https://duckduckgo.com/?q='"$opt ""$i"\
		--load-wait-time $(( ( RANDOM % 5 )  + 6 ))\
		--save-wait-time $(( ( RANDOM % 5 )  + 6 ))\
		--destination "./$i.$opt.duck.html"
	rm -r *_files
done < "$list"

