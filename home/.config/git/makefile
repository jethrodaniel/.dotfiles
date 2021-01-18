VERSION = 2.30.0
SRC_URL = https://github.com/git/git/archive/v$(VERSION).tar.gz

build: prereqs build/git-$(VERSION)
	cd build/git-$(VERSION) && make configure && ./configure --prefix=/usr && make && sudo make install
	$(MAKE) clean
build/git-$(VERSION): build/git-v$(VERSION).tar.gz
	tar xzvf build/git-v$(VERSION).tar.gz -C build
build/git-v$(VERSION).tar.gz: build_dir
	wget $(SRC_URL) -O $@
build_dir:
	mkdir -p build
prereqs:
	sudo yum groupinstall "Development Tools"
	sudo yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel libcurl-devel
clean:
	rm -rf build
