# get system up to-date
yum update -y && yum upgrade -y

# install the extra packages (all the good stuff, like i3, xterm, etc)
yum install -y epel-release
yum update -y && yum upgrade -y

# essentials
yum install -y vim tmux git firefox stow ntfs-3g ntfsprogs mutt python3 ruby

# desktop env
yum install -y xterm i3 dmenu xclip xbacklight redshift


yum install -y openssl11
git clone https://github.com/qutebrowser/qutebrowser.git
cd qutebrowser
python3 scripts/mkvenv.py
# .venv/bin/python3 -m qutebrowser
