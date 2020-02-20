# dotfiles

![](https://img.shields.io/github/license/jethrodaniel/dotfiles.svg)

uses [stow][stow] and [git submodules][submodules] to set up an easily
depolyable set of dotfiles. Or maintainable, at least.

**note**: the install script is dangerous, so `¯\_(ツ)_/¯`...

### installation

```
curl -s "https://raw.githubusercontent.com/jethrodaniel/dotfiles/master/install.sh" | bash
```

this should take a bit. check out the install scripts ([install.sh](install.sh) and [dotfiles](dotfiles)) for more details.

#### tmux

see [.tmux](https://github.com/jethrodaniel/.tmux)

#### vim

see [.vim](https://github.com/jethrodaniel/.vim)

<!-- links -->
[stow]: https://www.gnu.org/software/stow/
[submodules]: https://git-scm.com/book/en/v2/git-tools-submodules

### etc

Sound not working?

```
sudo apt-get install pavucontrol
pavucontrol
```

- https://askubuntu.com/a/1051423/651414
