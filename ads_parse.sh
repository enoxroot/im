#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#

uri=$1

if [ -z "$uri" ]
then
	read uri
fi

echo -e "name\tads"
cat "$uri" | tr '<>;' '\n\n\n'| grep 'Яндекс: нашлось' | sed '/(e)/d; /^Нашлось/d; s/ купить — Яндекс: нашлось /\t/g; s/ объявл.*$//g'
