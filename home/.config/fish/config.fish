#
#    ___======____=---=)
#  /T            \_--===)
#  [ \ (0)   \~    \_-==)
#   \      / )J~~    \-=)
#    \\\\___/  )JJ~~~   \)
#     \_____/JJ~~~~~    \\
#     / \  , \J~~~~~     \\
#    (-\)\=|\\\\\~~~~       L__
#    (\\\\)  (\\\\\)_           \==__
#     \V    \\\\\) ===_____   \\\\\\\\\\\\
#            \V)     \_) \\\\\\\\JJ\J\)
#                        /J\JT\JJJJ)
#                        (JJJ| \UUU)
#                         (UU)'
#
# Fish shell configuration

# Enable vi mode
fish_vi_key_bindings

# Better vim keys
#
# Find key names using `fish_key_reader`, and list all possible
# commands using `bind -f`.
#
# From <https://stackoverflow.com/a/48958650/7132678>
#
if test "$__fish_active_key_bindings" = "fish_vi_key_bindings"
  # jj for <ESC>
  bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
end

# Customize the mode indicator.
#
# Found from >
#   functions fish_mode_prompt
#   functions fish_default_mode_prompt
# <
#
function fish_mode_prompt --description 'Display the prompt mode'
  if test "$fish_key_bindings" = 'fish_vi_key_bindings'
    or test "$fish_key_bindings" = 'fish_hybrid_key_bindings'
    switch $fish_bind_mode
      case default
        set_color --bold white
        echo '🚬 '
      case insert
        set_color --bold white
        echo '🍸'
      case replace_one
        set_color --bold white
        echo '🥃'
      case visual
        set_color --bold white
        echo '🍺 '
    end
    set_color normal
    echo -n ' '
  end
end

# Git status in prompt.
#
# <https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_git_prompt.fish>
# <https://www.martinklepsch.org/posts/git-prompt-for-fish-shell.html>
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showcolorhints 'yes'

# Set the prompt
#
function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
