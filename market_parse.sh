#!/usr/bin/env bash
#

uri=$1

if [ -z "$uri" ]
then
	read uri
fi

echo -e "name\tmarket"
links -dump "$uri" -html-assume-codepage UTF-8 | grep -v '*' | grep -vE 'СравнитьВ сравнении|Добавить в отложенные|Новинка|отзыв|предлож|доставка|самовывоз|Гарантия производителя|Посмотреть на карте|Пожаловаться|Защищённая покупка|Акция|\[IMG\]' | grep -vE "^[0-9. ]*$" | sed 's/\t/ /g' | nvim - -esn -c 'set nowrapscan | exe "%norm gg/ОтложитьОтложено\ndddd/₽\nPA\t\033gJ"' -c 'w!/dev/fd/3|q!' 3>&1 >/dev/null 2>&1 | grep -E '[0-9] ₽$' | sed 's/ \+/ /g; s/^ //g; s/ *\t */\t/g' | sed 's/\t\([0-9]*\) \([0-9]*\)/\t\1\2/g;s/ *₽//'
