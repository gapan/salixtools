#!/bin/sh

cd $(dirname $0)
for i in clocksetup keyboardsetup localesetup usersetup servicesetup;do
	for j in `ls $i/locale/$i-*.po`;do
		echo "Compiling `echo $j|sed "s|/locale||"`"
		msgfmt $j -o `echo $j | sed "s/.po//"`.mo
	done
done
for i in `ls servicesetup/locale/service-*.po`;do
	echo "Compiling `echo $i|sed "s|/locale||"`"
	msgfmt $i -o `echo $i | sed "s/.po//"`.mo
done
