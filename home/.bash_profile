#    _               _                           __ _ _
#   | |__   __ _ ___| |__       _ __  _ __ ___  / _(_) | ___
#   | '_ \ / _` / __| '_ \     | '_ \| '__/ _ \| |_| | |/ _ \
#  _| |_) | (_| \__ \ | | |    | |_) | | | (_) |  _| | |  __/
# (_)_.__/ \__,_|___/_| |_|____| .__/|_|  \___/|_| |_|_|\___|
#                        |_____|_|

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

export PATH="$HOME/.cargo/bin:$PATH"

# Set TERM
[ -n "$TMUX" ] && export TERM=screen-256color
