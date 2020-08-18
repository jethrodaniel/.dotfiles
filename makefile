default: install

/usr/bin/brightness:
	sudo cp ~/dotfiles/home/bin/brightness $@
	sudo chmod a+rw /sys/class/backlight/intel_backlight/brightness
	sudo chmod a+rw /sys/class/backlight/intel_backlight/max_brightness
	sudo usermod -aG video $(shell whoami)
	@echo "add the following via 'sudo visudo':"
	@echo
	@echo "## Allow people in the video group to change the brightness"
	@echo "# %video	ALL=/usr/bin/brightness	NOPASSWD: ALL"
	@echo

stow_home:
	stow home/

rbenv:
	stow rbenv_plugins/

install: apt stow_home tmux rbenv gems hooks

apt:
	sudo apt-get update
	sudo apt-get install -y build-essential curl file git gcc vim stow
	sudo apt-get install -y x11-xkb-utils xbacklight compton i3 pavucontrol ttf-ancient-fonts

tmux:
	sudo yum install -y tmux
	ln -fs ~/.tmux/conf ~/.tmux.conf

ruby: rbenv
	./rbenv_plugins/.rbenv/plugins/ruby-build/bin/rbenv-install 2.7.1
	./home/.rbenv/bin/rbenv global 2.7.1

hooks: ruby
	curl https://raw.githubusercontent.com/jethrodaniel/.git-hooks/master/install.sh | bash

gems: ruby
	gem install ripper-tags
	gem install gem-ripper-tags
	gem ripper_tags
