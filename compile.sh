#!/bin/sh

cd $(dirname $0)
for i in clocksetup keyboardsetup localesetup usersetup servicesetup service reposetup;do
	for j in `ls $i/po/*.po`;do
		echo "Compiling `echo $j|sed "s|/po||"`"
		msgfmt $j -o `echo $j | sed "s/\.po//"`.mo
	done
done
for i in clocksetup keyboardsetup localesetup usersetup servicesetup service update-all reposetup;do
	(
	cd $i/man
	echo "Compiling $i manpage"
	txt2tags *.t2t || exit 1
	)
done

