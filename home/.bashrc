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

# Set TERM
#
# Needed to prevent the following error:
#
#   tput: No value for $TERM and no -T specified
#
# Since `tput` inspects the current `$TERM` in order to outout the right
# control sequences
if [ -n "$TMUX" ]; then
  export TERM=xterm-256color
else
  export TERM=xterm
fi

# Load aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# brew
if [ -d $HOME/.linuxbrew ]; then
  eval $(~/.linuxbrew/bin/brew shellenv)

  # <https://docs.brew.sh/Shell-Completion>
  HOMEBREW_PREFIX=$(brew --prefix)
  if type brew &>/dev/null; then
    for COMPLETION in "$HOMEBREW_PREFIX"/etc/bash_completion.d/*
    do
      [[ -f $COMPLETION ]] && source "$COMPLETION"
    done
    if [[ -f ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh ]];
    then
      source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    fi
  fi
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

# cargo
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# composer
if [ -d "$HOME/.config/composer/vendor/bin" ]; then
  export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
if [ -d "$HOME/.composer/vendor/bin:$PATH" ]; then
  export PATH="$HOME/.composer/vendor/bin:$PATH"
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

# Set prompt. The space at the beginning is to separate the Readline mode
# indicators from the rest of the prompt.
set_prompt() {
  if [[ -e ~/dotfiles/home/.config/git/git-prompt.sh ]]; then
    source ~/dotfiles/home/.config/git/git-prompt.sh

    export GIT_PS1_SHOWCOLORHINTS=true     # Use colors
    export GIT_PS1_SHOWSTASHSTATE=true     # Something's stashed ($)
    export GIT_PS1_SHOWUNTRACKEDFILES=true # Untracked files present (%)
    export GIT_PS1_SHOWDIRTYSTATE=true     # Unstaged (*), staged (+) changes
    export GIT_PS1_SHOWUPSTREAM="auto"     # Behind (<), ahead (>), equal (=) to upstream
    export GIT_PS1_DESCRIBE_STYLE="branch" # More info when HEAD is detached

    local purple="\[$(tput setaf 13)\]"
    local blue="\[$(tput setaf 153)\]"
    local reset="\[$(tput sgr0)\]"

    PROMPT_COMMAND="__git_ps1 ' ${blue}\w${reset}' '${purple} λ ${reset}'"
  else
    # Use the Ubuntu default
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  fi
}
set_prompt
