DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o clocksetup.8 clocksetup.t2t || exit 1

.PHONY: clean
clean:
	rm -f clocksetup.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 clocksetup.8 $(DESTDIR)/usr/man/man8/

