log() {
  echo "=== $1 ==="
}

log 'installing prereqs...'
sudo apt update -y
sudo apt install -y make git vim tmux postgresql tree xclip rsync i3 i3lock redshift firefox xterm

if [ -d ~/dotfiles ]; then
  log 'found dotfiles'
else
  log 'no dotfiles, cloning'
  git clone --recursive https://github.com/jethrodaniel/dotfiles
fi
