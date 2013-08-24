# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

#export GDK_NATIVE_WINDOWS=true
export GNOME_DESKTOP_SESSION_ID="openbox"
export OOO_FORCE_DESKTOP="gnome"

setxkbmap es

amixer set Master 80% unmute

if (which dbus-launch &> /dev/null) && [ -z "{$DBUS_SESSION_BUS_ADDRESS}" ]; then
  dbus-launch --sh-syntax --exit-with-session
fi

RESOLUTION=$(xdpyinfo | grep dimensions | cut -d' ' -f7)
RESOLUTION_H=$(echo $RESOLUTION | cut -dx -f1)
RESOLUTION_V=$(echo $RESOLUTION | cut -dx -f2)

swarp $(($RESOLUTION_H/2)) $(($RESOLUTION_V/2))
unset RESOLUTION RESOLUTION_H RESOLUTION_V

xsetroot -solid black
conky &
tint2 &
parcellite &
volumeicon &
unclutter -idle 5 &
# nvidia-settings -l &
xscreensaver -no-splash &

# End Of File
