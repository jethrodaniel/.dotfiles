# dotfiles

[![Build Status](https://travis-ci.com/jethrodaniel/dotfiles.svg?branch=master)][travis]

Uses [stow][stow] and [git submodules][submodules] to set up an easily
depolyable set of dotfiles.

### Installation

```
curl -s "https://raw.githubusercontent.com/jethrodaniel/dotfiles/master/install.sh" | bash
```

This should take a bit. Check out [install.sh] for more details.

#### Manual steps


#### tmux

Be sure to initalize [tpm][tpm] by typing <kbd>ctrl</kbd>+<kbd>f</kbd>+<kbd>I</kbd> inside a tmux session (be patient), then restarting tmux.

#### vim

You'll need to install the gui in order to get vim complied with `+clipboard`. Gotta have `"+`.

```
brew edit vim
```

#### stow

stow will not overwrite files, but this will

```
./stow.rb
```

### What it do

🍺 [brew][brew] is used to install whatever packages we can, to enhance portability.

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
- [ripper-tags](https://github.com/tmm1/ripper-tags)
- [gem-ripper-tags](https://github.com/lzap/gem-ripper-tags)
- [gem-browse](https://github.com/tpope/gem-browse)

### Updating

```
homeshick pull dotfiles
homeshick link dotfiles # Needed to add new files
```

#### Subprojects

Some functionality was split into various git submodules

- [vim](https://github.com/jethrodaniel/.vim)
- [tmux](https://github.com/jethrodaniel/.tmux)
- [git hooks](https://github.com/jethrodaniel/.git-hooks)

[stow]: https://www.gnu.org/software/stow/
[submodules]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[travis]: https://travis-ci.com/jethrodaniel/dotfiles
[tpm]: https://github.com/tmux-plugins/tpm
[brew](https://www.gnu.org/software/stow/)
