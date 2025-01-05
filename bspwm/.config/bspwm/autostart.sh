# Wallpaper
nitrogen --restore

# Fix cursor
xsetroot -cursor_name left_ptr &

# Keybindings
pgrep -x sxhkd > /dev/null || sxhkd &

# Polybar
polybar &

# Repeat rate
xset r rate 200

# Polkit
lxsession &
