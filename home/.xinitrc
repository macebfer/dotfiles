#!/bin/sh

# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

DEFAULT_SESSION=Cinnamon
#DEFAULT_SESSION=openbox-session

DBUS_LAUNCH="dbus-launch"
CK_LAUNCH="ck-launch-session"

SESSION="${DEFAULT_SESSION}"

case ${1} in
  Cinnamon)
    SESSION='gnome-session-cinnamon'
    ;;
  BlackBox)
    SESSION='startblackbox'
    ;;
  IceWM)
    SESSION='icewm-session'
    ;;
  WindowMaker)
    SESSION='wmaker'
    ;;
  FluxBox)
    SESSION='startfluxbox'
    ;;
  Fvwm)
    SESSION='fvwm'
    ;;
  E17)
    SESSION='enlightenment_start'
    ;;
  Openbox)
    SESSION='openbox-session'
    ;;
  Pekwm)
    SESSION='pekwm'
    ;;
  ROX)
    SESSION='rox-session'
    ;;
  XFce4)
    SESSION='startxfce4'
    ;;
  LXDE)
    SESSION='startlxde'
    ;;
  Gnome)
    SESSION='gnome-session'
    ;;
esac

#exec ${DBUS_LAUNCH} ${SESSION}
exec gnome-session-cinnamon
