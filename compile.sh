#!/bin/sh

for i in clocksetup keyboardsetup localesetup usersetup;do
	for j in `ls $i/locale/*.po`;do
		echo "Compiling $i/$j"
		msgfmt $j -o `echo $j | sed "s/.po//"`.mo
	done
done
