# dotfiles

[![Build Status](https://travis-ci.com/jethrodaniel/dotfiles.svg?branch=master)](https://travis-ci.com/jethrodaniel/dotfiles)

Uses [homeshick](https://github.com/andsens/homeshick) and [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to set up an easily depolyable set of dotfiles.

### Installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/dotfiles /tmp/dotfiles \
  && /tmp/dotfiles/dotfiles -y install \
  && rm -rf /tmp/dotfiles
```

Then

* Be sure to initalize [tpm](https://github.com/tmux-plugins/tpm) by typing <kbd>ctrl</kbd>+<kbd>f</kbd>+<kbd>I</kbd> inside a tmux session (be patient), then restarting tmux.

### What it do

💣 The install script is quite destructive. Beware.

🍺 [brew](https://brew.sh/) is used to install whatever packages we can, to enhance portability.

#### Brew packages

- [git](https://git-scm.com/)
- [vim](https://www.vim.org/)
- [homeshick](https://github.com/andsens/homeshick)
- [tree](https://github.com/Homebrew/homebrew-core/blob/master/Formula/tree.rb)
- [hub](https://github.com/github/hub)
- [xclip](https://github.com/astrand/xclip)
- [rbenv](https://github.com/rbenv/rbenv)
- [pyenv](https://github.com/pyenv/pyenv)
- [tmux](https://github.com/tmux/tmux)
- [curl](https://curl.haxx.se/)
- [feh](https://feh.finalrewind.org/)
- [fish](https://github.com/fish-shell/fish-shell)
- [figlet](http://www.figlet.org/)
- [tig](https://github.com/jonas/tig)
- [gdb](https://www.gnu.org/software/gdb/)
- [conan](https://conan.io/)

#### apt packages (Debian-based)

- [x11-xkb-utils](https://packages.debian.org/jessie/x11-xkb-utils)
- [i3](https://i3wm.org/)
- [pavucontrol](https://launchpad.net/ubuntu/+source/pavucontrol)
- [ttf-ancient-fonts](https://launchpad.net/ubuntu/+source/ttf-ancient-fonts)

#### Ruby gems

- [overcommmit](https://github.com/sds/overcommit)

### Updating

```
homeshick cd dotfiles
homeshick pull dotfiles
git submodule foreach git checkout master && git pull
homeshick link dotfiles # Needed to add new files
```

#### Vim

Vim settings are managed as a [submodule](https://github.com/jethrodaniel/.vim), and can be installed on their own, if desired.

#### Tmux

Tmux settings are managed as a [submodule](https://github.com/jethrodaniel/.tmux), and can be installed on their own, if desired.

#### hooks

Git hook settings are managed as a [submodule](https://github.com/jethrodaniel/.git-hooks), and can be installed on their own, if desired.
