DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o usersetup.8 usersetup.t2t || exit 1

.PHONY: clean
clean:
	rm -f usersetup.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 usersetup.8 $(DESTDIR)/usr/man/man8/

