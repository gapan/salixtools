DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o netsetup.8 netsetup.t2t || exit 1

.PHONY: clean
clean:
	rm -f netsetup.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 netsetup.8 $(DESTDIR)/usr/man/man8/

