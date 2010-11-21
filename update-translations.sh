#!/bin/sh

for i in clocksetup keyboardsetup localesetup service servicesetup usersetup; do
	cd $i
	echo "Creating $i.pot file..."
	xgettext --from-code=utf-8 -L shell -o po/$i.pot $i
	cd po
	for j in `ls *.po`; do
		echo -n "Merging $j translation for $i..."
		msgmerge -U $j $i.pot
	done
	rm -f ./*~
	cd ../../
done
