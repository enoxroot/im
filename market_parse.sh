#!/usr/bin/env bash
#

uri=$1

if [ -z "$uri" ]
then
	read uri
fi

echo -e "name\tmarket"
links -dump "$uri" -html-assume-codepage UTF-8 | tr -d '\n' | sed 's/ ₽/ ₽\n/g;s/ОтложитьОтложено/\nОтложитьОтложено/g;s/₽/₽\n/g' | sed 's/^ *//g;s/ОтложитьОтложено   СравнитьВ сравнении   //g; s/   /\t/g' | grep ₽ | sed '/Показать еще/d' | awk -F'\t' 'OFS="\t"{print $2,$3}' | sed '/^\s*$/d' | sed '/отзыв/d' | grep ₽ | sed 's/\t\([0-9]*\) \([0-9]*\)/\t\1\2/g;s/ ₽//'
