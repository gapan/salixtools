DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o service.8 service.t2t || exit 1

.PHONY: clean
clean:
	rm -f service.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 service.8 $(DESTDIR)/usr/man/man8/

