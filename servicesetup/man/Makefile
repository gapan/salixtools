DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o servicesetup.8 servicesetup.t2t || exit 1

.PHONY: clean
clean:
	rm -f servicesetup.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 servicesetup.8 $(DESTDIR)/usr/man/man8/

