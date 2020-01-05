#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ `hostname` = shibusa ]; then
  xrandr --output DP-0 --left-of DP-4 --primary
  killall polybar 2> /dev/null

  redshift -l 32.22174:-110.92648 &
  polybar main &
  polybar secondary &
else
  polybar nanami &
fi

if [ -f "~/MEGA/Photos/background.jpg" ]; then
  feh --bg-center ~/MEGA/Photos/background.jpg
fi


# picom -c ~/.config/picom/picom.conf &
alacritty &
exec bspwm
