DESTDIR ?= /

.PHONY: man
man:
	txt2tags -o reposetup.8 reposetup.t2t || exit 1

.PHONY: clean
clean:
	rm -f reposetup.8

.PHONY: install
install:
	install -d -m 755 $(DESTDIR)/usr/man/man8/
	install -m644 reposetup.8 $(DESTDIR)/usr/man/man8/

