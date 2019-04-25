#
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#
# ~/.bashrc: executed by bash(1) for non-login shells.
#------------------------------------------------------------

# Load Ubuntu bashrc defaults
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_ubuntu_defaults
fi

# System editor
export EDITOR=vim

# Don't put duplicate lines or lines starting with a space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000000       # Store at most 1,000,000 lines in memory
HISTFILESIZE=1000000   # Store at most 1,000,000 lines on disk

# Load aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# homeshick
if [ -d $HOME/.homesick ]; then
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"
  source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
fi

# SDKMAN!
if [ -d $HOME/.sdkman ]; then
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Ruby oci8 support
# See <https://github.com/kubo/ruby-oci8/blob/master/docs/install-instant-client.md>
export LD_LIBRARY_PATH="/opt/oracle/instantclient_18_3"

# rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"

  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi
fi

# Tmux tab completion
if [ -f ~/.tmux/bash_completion_tmux.sh ]; then
  . ~/.tmux/bash_completion_tmux.sh
fi

# Make caps-lock into another ctrl
setxkbmap -option caps:ctrl_modifier

# Use g for git
function g() {
  git $@
}

# Use b for bundle exec
function b() {
  bundle exec $@
}

# Use r for rails
function r() {
  bundle exec rails $@
}

# Use c for cargo
function c() {
  cargo $@
}

# Git branch in prompt.
function parse_git_branch() {
  git -c color.ui=always branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$(parse_git_branch) "
