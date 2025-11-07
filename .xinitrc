picom &
nitrogen --restore &
/usr/libexec/polkit-gnome-authentication-agent-1 &

while true; do
    xsetroot -name "$(date '+%a %d %b %H:%M')"
    sleep 60
done &
exec dwm
