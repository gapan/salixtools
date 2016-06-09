DESTDIR ?= /
PACKAGE_LOCALE_DIR ?= /usr/share/locale

export DESTDIR PACKAGE_LOCALE_DIR

.PHONY: all
all: man mo

.PHONY: mo
mo:
	$(MAKE) -C po

.PHONY: man
man:
	$(MAKE) -C man

.PHONY: clean
clean:
	$(MAKE) clean -C po
	$(MAKE) clean -C man

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/sbin
	install -m 755 service $(DESTDIR)/usr/sbin/
	install -d -m 755 $(DESTDIR)/usr/share/salixtools/servicesetup
	install -m 644 service-blacklist $(DESTDIR)/usr/share/salixtools/servicesetup/
	install -m 644 shell-colours $(DESTDIR)/usr/share/salixtools/servicesetup/
	install -d -m 755 $(DESTDIR)/etc/rc.d/desc.d
	install -m 644 standard.txt $(DESTDIR)/etc/rc.d/desc.d/
	$(MAKE) install -C po
	$(MAKE) install -C man

.PHONY: pot
pot:
	xgettext --from-code=utf-8 -L shell -o po/service.pot service

.PHONY: update-po
update-po:
	$(MAKE) update-po -C po

.PHONY: tx-pull
tx-pull:
	tx pull -a
	$(MAKE) remove-empty -C po

.PHONY: stat
stat:
	$(MAKE) stat -C po

