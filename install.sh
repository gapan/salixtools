#!/bin/sh
# install script for salixtools

cd $(dirname $0)
install -d -m 755 $DESTDIR/usr/sbin
install -d -m 755 $DESTDIR/usr/share/salixtools/servicesetup
install -d -m 755 $DESTDIR/etc/rc.d/desc.d

for i in clocksetup keyboardsetup localesetup usersetup servicesetup; do
	install -m 755 $i/$i $DESTDIR/usr/sbin/
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

install -d -m 755 $DESTDIR/usr/man/man8
for i in clocksetup keyboardsetup localesetup usersetup servicesetup; do
	(
	cd $i/man
	for j in `ls *.8`; do
		install -m644 $j $DESTDIR/usr/man/man8/
	done
	)
done

install -m 644 keyboardsetup/keymaps $DESTDIR/usr/share/salixtools/
install -m 755 keyboardsetup/rc.numlock $DESTDIR/etc/rc.d/

install -m 644 servicesetup/service-blacklist $DESTDIR/usr/share/salixtools/servicesetup/
install -m 644 servicesetup/shell-colours $DESTDIR/usr/share/salixtools/servicesetup/
install -m 644 servicesetup/standard.txt $DESTDIR/etc/rc.d/desc.d/

