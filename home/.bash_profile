# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]
then
  . ~/.bashrc
fi

# user specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# start the GUI on initial login
if systemctl -q is-active graphical.target && [[ ! "$DISPLAY" ]]
then
  startx
fi
