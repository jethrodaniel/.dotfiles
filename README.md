# dotfiles

[![Build Status](https://travis-ci.com/jethrodaniel/dotfiles.svg?branch=master)](https://travis-ci.com/jethrodaniel/dotfiles)

Uses [homeshick](https://github.com/andsens/homeshick) and [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to set up an easily depolyable set of dotfiles.

### Installation

```
git clone https://github.com/jethrodaniel/dotfiles /tmp/dotfiles \
  && /tmp/dotfiles/dotfiles -y install \
  && rm -rf /tmp/dotfiles
```

Then

* Be sure to initalize [tpm](https://github.com/tmux-plugins/tpm) by typing <kbd>ctrl</kbd>+<kbd>f</kbd>+<kbd>I</kbd> inside a tmux session (be patient), then restarting tmux.

### What it do

💣 The install script is quite destructive. Beware.

🍺 [brew](https://brew.sh/) is used to install whatever packages we can, to enhance portability.

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
