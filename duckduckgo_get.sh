#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#

list=$2
opt=$1

case "$1" in
	-g) opt='!g' ;;
	-y) opt='!ya';;
	-w) opt='!w' ;;
	-t) opt='!gt';;
	*) list=$1; opt='';;
esac

while read i
do
	save_page_as 'https://duckduckgo.com/?q='"$opt ""$i"\
		--load-wait-time $(( ( RANDOM % 5 )  + 6 ))\
		--save-wait-time $(( ( RANDOM % 5 )  + 6 ))\
		--destination "./$i.$opt.duck.html"
	rm -r *_files
done < "$list"

