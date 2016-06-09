DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o update-all.8 update-all.t2t || exit 1

.PHONY: clean
clean:
	rm -f update-all.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 update-all.8 $(DESTDIR)/usr/man/man8/

