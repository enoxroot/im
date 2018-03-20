#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#

uri=$1

if [ -z "$uri" ]
then
	read uri
fi

echo -e "name\twordstat"
cat "$uri" | tr '<>' '\n\n' | grep 'Что искали' | gawk -F '«' '{print $2}' | sed 's/&nbsp;//g;s/ показ.* в месяц//g;s/»—/\t/g'
