# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-18.04'

  config.vm.provision 'shell', inline: <<~SHELL
    git clone https://github.com/jethrodaniel/dotfiles /tmp/dotfiles \
      && /tmp/dotfiles/install \
      && rm -rf /tmp/dotfiles
  SHELL
end
