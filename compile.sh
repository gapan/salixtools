#!/bin/sh

cd $(dirname $0)
for i in clocksetup keyboardsetup localesetup usersetup servicesetup service;do
	for j in `ls $i/po/*.po`;do
		echo "Compiling `echo $j|sed "s|/po||"`"
		msgfmt $j -o `echo $j | sed "s/.po//"`.mo
	done
done
for i in clocksetup keyboardsetup localesetup usersetup servicesetup service;do
	(
	cd $i/man
	echo "Compiling $i manpage"
	txt2tags *.t2t || exit 1
	#txt2tags apparently doesn't have an option to change the man
	#page number
	for j in `ls *.man`;do
		sed -i "1s/ 1 / 8 /" $j
		mv $j `echo $j | sed "s/\.man//"`.8
	done
	)
done

