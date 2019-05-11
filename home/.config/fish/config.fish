# Enable vi mode
fish_vi_key_bindings

# Better vim keys
#
# Find key names using `fish_key_reader`, and list all possible
# commands using `bind -f`.
#

# From <https://stackoverflow.com/a/48958650/7132678>
if test "$__fish_active_key_bindings" = "fish_vi_key_bindings"
  bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
end

# Customize the mode indicator.
#
# Found from >
#   functions fish_mode_prompt
#   functions fish_default_mode_prompt
# <
#
# 🕇 𖤐  🔥 💉 💊  ☕ 🍺 🍶 🍷 🍹 🥃
function fish_mode_prompt --description 'Display the default mode for the prompt'
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    switch $fish_bind_mode
      case default
        set_color --bold white
        echo '🚬 '
      case insert
        set_color --bold white
        echo '🍸'
      case replace_one
        set_color --bold white
        echo '🍷'
      case visual
        set_color --bold white
        echo '🍺 '
    end
    set_color normal
    echo -n ' '
  end
end
