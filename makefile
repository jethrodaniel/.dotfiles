default:
	stow home/

install: apt tmux gems hooks

apt:
	sudo apt-get update
	sudo apt-get install -y build-essential curl file git gcc tmux vim stow
	sudo apt-get install -y x11-xkb-utils xbacklight compton i3 pavucontrol ttf-ancient-fonts

tmux:
	ln -fs ~/.tmux/conf ~/.tmux.conf

ruby:
	rbenv local 2.7.1 || rbenv install 2.7.1 && rbenv local 2.7.1

hooks: ruby
	curl https://raw.githubusercontent.com/jethrodaniel/.git-hooks/master/install.sh | bash

gems: ruby
	gem install ripper-tags
	gem install gem-ripper-tags
	gem ripper_tags
