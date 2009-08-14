#!/bin/sh
# install script for salixtools

install -d -m 755 $DESTDIR/usr/sbin
install -d -m 755 $DESTDIR/usr/share/applications
install -d -m 755 $DESTDIR/usr/share/salixtools/pixmaps
install -d -m 755 $DESTDIR/usr/share/salixtools/servicesetup
install -d -m 755 $DESTDIR/etc/rc.d/desc.d

for i in clocksetup keyboardsetup localesetup usersetup servicesetup; do
	install -m 755 $i/$i $DESTDIR/usr/sbin/
	install -m 644 $i/$i.desktop $DESTDIR/usr/share/applications/
	install -m 644 $i/$i-kde.desktop $DESTDIR/usr/share/applications/
	for j in `ls $i/locale/$i-*.mo`; do
		install -d -m 755 \
		$DESTDIR/usr/share/locale/`basename $j|sed "s/$i-//"|sed "s/.mo//"`/LC_MESSAGES \
		2> /dev/null
		install -m 644 $j \
		$DESTDIR/usr/share/locale/`basename $j|sed "s/$i-//"|sed "s/.mo//"`/LC_MESSAGES/$i.mo
	done
done
install -m 755 servicesetup/service $DESTDIR/usr/sbin/
for i in `ls servicesetup/locale/service-*.mo`; do
	install -d -m 755 \
	$DESTDIR/usr/share/locale/`basename $i|sed "s/service-\(.*\).mo/\1/"`/LC_MESSAGES \
	2> /dev/null
	install -m 644 $i \
	$DESTDIR/usr/share/locale/`basename $i|sed "s/service-\(.*\).mo/\1/"`/LC_MESSAGES/service.mo
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
install -m 755 keyboardsetup/rc.numlock $DESTDIR/etc/rc.d/

install -m 644 servicesetup/service-blacklist $DESTDIR/usr/share/salixtools/servicesetup/
install -m 644 servicesetup/shell-colours $DESTDIR/usr/share/salixtools/servicesetup/
install -m 644 servicesetup/standard.txt $DESTDIR/etc/rc.d/desc.d/

