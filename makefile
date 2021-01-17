STOW := stow --verbose=2 home
STOW_QUIET := stow --verbose=1 home

install: ruby vim tmux i3 brightness gems
stow:
	$(STOW)
rbenv:
	mkdir -p home/.rbenv/plugins
	git clone --depth=1 https://github.com/sstephenson/ruby-build.git home/.rbenv/plugins/ruby-build || \
	  echo "looks like rbenv-install is present (well, git err'd, so maybe)"
	$(STOW_QUIET)
ruby: rbenv stow
	./home/.rbenv/bin/rbenv install --skip-existing 2.7.1
	./home/.rbenv/bin/rbenv global 2.7.1
vim:
	vim --version | head -n1 | grep "VIM - Vi IMproved 8.2 (2019 Dec 12" || $(MAKE) -C home/.vim
tmux:
	tmux -V | grep -q "^tmux 3.1c" || $(MAKE) -C home/.tmux
i3:
	i3 --version | grep -q "i3 version 4.12" || $(MAKE) -C home/.config/i3
brightness: ruby
	brightness -h >/dev/null || { cd home/code/ruby/brightness && rake install && cd - ; }
gems: ruby
	gem install ripper-tags
