.PHONY: install uninstall lint check

install:
	./install.sh

uninstall:
	./uninstall.sh

lint:
	shellcheck install.sh uninstall.sh

check:
	bash -n install.sh
	bash -n uninstall.sh
