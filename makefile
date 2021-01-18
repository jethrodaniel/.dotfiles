STOW := stow --verbose=2 home
STOW_QUIET := stow --verbose=1 home

install: prereqs ruby vim tmux i3 brightness gems docker
prereqs:
	yum -y update all
	yum install -y deltarpm
	yum install -y epel-release yum-utils
	yum install -y yum-axelget
stow:
	$(STOW)
ruby_prereqs:
	yum install -y git-core make patch bzip2 autoconf automake libtool bison zlib
	yum install -y gcc-c++
	yum install -y libyaml-devel zlib-devel libffi-devel openssl-devel sqlite-devel readline readline-devel
rbenv: ruby_prereqs
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
docker:
	sudo yum-config-manager --enable centos-extra
	sudo yum install -y yum-utils
	sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum install -y docker-ce docker-ce-cli containerd.io
	sudo systemctl start docker
	sudo docker run hello-world
	sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo docker-compose --version
