log() {
  echo "=== $1 ==="
}

log 'installing prereqs...'
sudo apt update -y
sudo apt install -y make git vim tmux postgresql tree xclip rsync i3 i3lock redshift firefox xterm npm

if [ -d ~/dotfiles ]; then
  log 'found dotfiles'
else
  log 'no dotfiles, cloning'
  git clone --recursive https://github.com/jethrodaniel/dotfiles
fi

if [ -d ~/.rbenv ]; then
  log 'found rbenv'
else
  log 'no rbenv, cloning'
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

log 'yarn/js'
sudo npm install -g yarn
