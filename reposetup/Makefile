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
	install -m 755 reposetup $(DESTDIR)/usr/sbin/
	install -d -m 755 $(DESTDIR)/usr/share/salixtools/reposetup
	install -m 644 repomirrors $(DESTDIR)/usr/share/salixtools/reposetup
	install -d -m 755 $(DESTDIR)/etc/salixtools
	install -m 644 repos-custom $(DESTDIR)/etc/salixtools/
	$(MAKE) install -C po
	$(MAKE) install -C man

.PHONY: pot
pot:
	xgettext --from-code=utf-8 -L shell -o po/reposetup.pot reposetup

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

.PHONY: upload-mirrors
upload-mirrors:
	scp repomirrors repo@salixos.org:repo/MIRRORS

