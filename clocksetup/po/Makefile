DESTDIR ?= /
PACKAGE_LOCALE_DIR ?= /usr/share/locale

.PHONY: mo
mo:
	for j in `ls *.po`;do \
		msgfmt $$j -o `echo $$j | sed "s/\.po//"`.mo; \
	done

.PHONY: clean
clean:
	rm -f *.mo
	rm -f *.po~

.PHONY: install
install:
	for j in `ls *.mo`; do \
		install -d -m 755 \
		$(DESTDIR)/$(PACKAGE_LOCALE_DIR)/`basename $$j|sed "s/.mo//"`/LC_MESSAGES \
		2> /dev/null; \
		install -m 644 $$j \
		$(DESTDIR)/$(PACKAGE_LOCALE_DIR)/`basename $$j|sed "s/.mo//"`/LC_MESSAGES/clocksetup.mo; \
	done

.PHONY: update-po
update-po:
	for j in `ls *.po`; do \
		msgmerge -U $$j clocksetup.pot; \
	done
	rm -f ./*~

.PHONY: remove-empty
remove-empty:
	for j in `ls *.po`; do \
		msgfmt --statistics $$j 2>&1 | grep "^0 translated" > /dev/null \
		&& rm $$j || true; \
		rm -f messages.mo; \
	done

.PHONY: stat
stat:
	@for j in `ls *.po`; do \
		echo -en "$$j:\n  "; \
		msgfmt --statistics $$j 2>&1; \
		rm -f messages.mo; \
	done

