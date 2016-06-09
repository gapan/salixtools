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
	install -m 755 keyboardsetup $(DESTDIR)/usr/sbin/
	install -d -m 755 $(DESTDIR)/usr/share/salixtools/keyboardsetup
	install -m 644 keymaps $(DESTDIR)/usr/share/salixtools/
	install -m 644 10-keymap.conf-template $(DESTDIR)/usr/share/salixtools/keyboardsetup
	install -d -m 755 $(DESTDIR)/etc/rc.d
	install -m 755 rc.numlock $(DESTDIR)/etc/rc.d/
	$(MAKE) install -C po
	$(MAKE) install -C man

.PHONY: pot
pot:
	xgettext --from-code=utf-8 -L shell -o po/keyboardsetup.pot keyboardsetup

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

