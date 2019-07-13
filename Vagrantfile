# vi: set ft=ruby :
# frozen_string_literal: true

# To install vagrant on 64-but Debian systems, use
#
# wget https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.deb -O vagrant.deb \
#   && apt-get install ./vagrant.deb \
#   && rm vagrant.deb
#
# For other systems, see https://www.vagrantup.com/downloads.html

Vagrant.configure '2' do |config|
  config.vm.box = 'bento/ubuntu-18.04'

  config.vm.provision 'shell', privileged: true, inline: <<~SHELL
		sudo apt-get update && sudo apt-get upgrade -y
  SHELL

  config.vm.provision 'shell', privileged: false, inline: <<~SHELL
    rm -f ~/.bash_logout ~/.bashrc ~/.profile
		git clone --recurse-submodules https://github.com/jethrodaniel/dotfiles
    cd dotfiles
    ./dotfiles install -y
  SHELL
end
