#!/bin/sh
# install script for salixtools

install -d -m 755 $DESTDIR/usr/sbin
install -d -m 755 $DESTDIR/usr/share/applications
install -d -m 755 $DESTDIR/usr/share/salixtools/pixmaps

for i in clocksetup keyboardsetup localesetup usersetup; do
	install -m 755 $i/$i $DESTDIR/usr/sbin/
	install -m 644 $i/$i.desktop $DESTDIR/usr/share/applications/
	install -m 644 $i/$i-kde.desktop $DESTDIR/usr/share/applications/
	for j in `ls $i/locale/*.mo`; do
		install -d -m 755 \
		$DESTDIR/usr/share/locale/`basename $j|sed "s/$i-//"|sed "s/.mo//"`/LC_MESSAGES \
		2> /dev/null
		install -m 644 $j \
		$DESTDIR/usr/share/locale/`basename $j|sed "s/$i-//"|sed "s/.mo//"`/LC_MESSAGES/$i.mo
	done
done

for i in `ls icons/*.svg`; do
	install -d -m 755 $DESTDIR/usr/share/icons/hicolor/scalable/apps/
	install -m 644 $i $DESTDIR/usr/share/icons/hicolor/scalable/apps/
done

for i in 64 48 32 24 22 16; do
	for j in `ls icons/*-$i.png 2> /dev/null`; do
		install -d -m 755 \
		$DESTDIR/usr/share/icons/hicolor/${i}x${i}/apps/ \
		2> /dev/null
		install -m 644 $j \
		$DESTDIR/usr/share/icons/hicolor/${i}x${i}/apps/`basename $j|sed "s/-$i//"`
	done
done

for i in `ls pixmaps/*`; do
	install -m 644 $i $DESTDIR/usr/share/salixtools/pixmaps/
done

install -m 644 keyboardsetup/keymaps $DESTDIR/usr/share/salixtools/
