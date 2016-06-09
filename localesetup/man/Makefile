DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o localesetup.8 localesetup.t2t || exit 1

.PHONY: clean
clean:
	rm -f localesetup.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 localesetup.8 $(DESTDIR)/usr/man/man8/

