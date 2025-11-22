export QT_QPA_PLATFORMTHEME=qt6ct
export XCURSOR_THEME="Breeze Light"
export XCURSOR_SIZE=24

sxhkd &
picom &
nitrogen --restore &
/usr/libexec/polkit-mate-authentication-agent-1 &
/usr/libexec/xdg-desktop-portal-gtk &
numlockx &
xsetroot -cursor_name left_ptr
while true; do
    xsetroot -name "$(date '+%a %d %b %H:%M')"
    sleep 60
done &
exec dwm
