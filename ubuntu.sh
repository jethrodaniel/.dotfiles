log() {
  echo "=== $1 ==="
}

log 'installing prereqs...'
sudo apt update -y
sudo apt install -y make git vim tree xclip rsync i3 i3lock redshift firefox xterm npm ncdu

log 'dotfiles'
if [ -d ~/dotfiles ]; then
  log 'found dotfiles'
else
  log 'no dotfiles, cloning'
  git clone --recursive https://github.com/jethrodaniel/dotfiles
fi

log 'rbenv'
if [ -d ~/.rbenv ]; then
  log 'found rbenv'
else
  log 'no rbenv, cloning'
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

log 'ruby'
rbenv install -s 2.7.1
rbenv install -s 3.0.0
rbenv global 3.0.0

log 'yarn/js'
sudo npm install -g yarn

log 'postgres'
sudo apt-get install postgresql libpq-dev

log 'tmux'
ln -sv ~/.tmux/conf ~/.tmux.conf
sudo apt install -y tmux

log 'keynav'
sudo apt install -y keynav
