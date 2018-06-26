#    _               _         _                         _
#   | |__   __ _ ___| |__     | | ___   __ _  ___  _   _| |_
#   | '_ \ / _` / __| '_ \    | |/ _ \ / _` |/ _ \| | | | __|
#  _| |_) | (_| \__ \ | | |   | | (_) | (_| | (_) | |_| | |_
# (_)_.__/ \__,_|___/_| |_|___|_|\___/ \__, |\___/ \__,_|\__|
#                        |_____|       |___/
#
# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
