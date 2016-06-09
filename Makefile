DESTDIR ?= /
PACKAGE_LOCALE_DIR ?= /usr/share/locale
TOOLS = clocksetup \
		keyboardsetup \
		localesetup \
		netsetup \
		reposetup \
		service \
		servicesetup \
		update-all \
		usersetup

export DESTDIR PACKAGE_LOCALE_DIR

.PHONY: all
all: man mo

.PHONY: mo
mo:
	for i in $(TOOLS); do \
		$(MAKE) mo -C $$i; \
	done

.PHONY: man
man:
	for i in $(TOOLS); do \
		$(MAKE) man -C $$i; \
	done

.PHONY: clean
clean:
	for i in $(TOOLS); do \
		$(MAKE) clean -C $$i; \
	done

.PHONY: install
install:
	for i in $(TOOLS); do \
		$(MAKE) install -C $$i; \
	done
	install -m 644 salix-version $(DESTDIR)/usr/share/salixtools/

.PHONY: pot
pot:
	for i in $(TOOLS); do \
		$(MAKE) pot -C $$i; \
	done

.PHONY: update-po
update-po:
	for i in $(TOOLS); do \
		$(MAKE) update-po -C $$i; \
	done

.PHONY: tx-pull
tx-pull:
	for i in $(TOOLS); do \
		$(MAKE) tx-pull -C $$i; \
	done

.PHONY: stat
stat:
	for i in $(TOOLS); do \
		$(MAKE) stat -C $$i; \
	done

