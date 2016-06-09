DESTDIR ?= /

export DESTDIR

.PHONY: all
all: man mo

.PHONY: mo
mo:
	@echo "No mo files to make."

.PHONY: man
man:
	$(MAKE) -C man

.PHONY: clean
clean:
	$(MAKE) clean -C man

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/sbin
	install -m 755 update-all $(DESTDIR)/usr/sbin/
	$(MAKE) install -C man

.PHONY: pot
pot:
	@echo "No pot file to make."

.PHONY: update-po
update-po:
	@echo "No po files to update."

.PHONY: tx-pull
tx-pull:
	@echo "No translations to pull."

.PHONY: stat
stat:
	@echo "No translations to stat."

