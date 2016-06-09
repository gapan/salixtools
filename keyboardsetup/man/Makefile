DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o keyboardsetup.8 keyboardsetup.t2t || exit 1

.PHONY: clean
clean:
	rm -f keyboardsetup.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 keyboardsetup.8 $(DESTDIR)/usr/man/man8/

