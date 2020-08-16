# .bashrc

# source global definitions
if [ -f /etc/bashrc ]
then
  . /etc/bashrc
fi

# system editor
export EDITOR=vim

# don't put duplicate lines or lines starting with a space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000000       # store at most 1,000,000 lines in memory
HISTFILESIZE=1000000   # store at most 1,000,000 lines on disk

# load aliases
if [ -f ~/.bash_aliases ]
then
  . ~/.bash_aliases
fi

# use terminal gpg
#export GPG_TTY=$(tty)

# rbenv
if [ -d $HOME/.rbenv ]
then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# tmux tab completion
if [ -f ~/.tmux/bash_completion_tmux.sh ]
then
  . ~/.tmux/bash_completion_tmux.sh
fi

# make caps-lock into another ctrl
setxkbmap -option caps:ctrl_modifier

# g for git
function g() {
  git "$@"
}

# b for bundle exec
function b() {
  bundle exec "$@"
}

# r for rails
function r() {
  bundle exec rails "$@"
}

# open vim with splits
function vo() {
  vim -O "$@"
}
function vp() {
  vim -p "$@"
}

# Set prompt. The space at the beginning is to separate the Readline mode
# indicators from the rest of the prompt.
set_prompt() {
  local git_prompt_file="$HOME/dotfiles/home/.config/git/vendor/git-prompt.sh"

  if [[ -e "$git_prompt_file" ]]; then
    source "$git_prompt_file"

    export GIT_PS1_SHOWCOLORHINTS=true     # Use colors
    export GIT_PS1_SHOWSTASHSTATE=true     # Something's stashed ($)
    export GIT_PS1_SHOWUNTRACKEDFILES=true # Untracked files present (%)
    export GIT_PS1_SHOWDIRTYSTATE=true     # Unstaged (*), staged (+) changes
    export GIT_PS1_SHOWUPSTREAM="auto"     # Behind (<), ahead (>), equal (=) to upstream
    export GIT_PS1_DESCRIBE_STYLE="branch" # More info when HEAD is detached

    local purple="\[$(tput setaf 13)\]"
    local blue="\[$(tput setaf 153)\]"
    local reset="\[$(tput sgr0)\]"

    PROMPT_COMMAND="__git_ps1 ' \A ${blue}\w${reset}' '${purple} ɃΔØ ${reset}'"
  else
    # Use the Ubuntu default (mostly)
    PS1=' \A ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  fi
}
set_prompt

