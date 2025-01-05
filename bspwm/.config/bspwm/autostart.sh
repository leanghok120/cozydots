# Wallpaper
nitrogen --restore

# Fix cursor
xsetroot -cursor_name left_ptr &

# Keybindings
pgrep -x sxhkd > /dev/null || sxhkd &

# Polybar
sh $HOME/.config/polybar/launch.sh &

# Picom
picom &

# Repeat rate
xset r rate 200

# Polkit
lxsession &
