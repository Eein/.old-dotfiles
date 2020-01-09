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


if [ `hostname` = nanami ]; then
  # 1366 resolution
  export MAIN_MONITOR=eDP1
  export POLYBAR_WIDTH=1342
elif [ `hostname` = shibusa ]; then
  export MAIN_MONITOR=DP-0
  export SECONDARY_MONITOR=DP-4
  export POLYBAR_WIDTH=1896
else
  export MAIN_MONITOR=$(xrandr --query | grep " connected" | cut -d" " -f1)
  # 1080 resolution
  export POLYBAR_WIDTH=1896
fi

if [ `hostname` = shibusa ]; then
  # Force set 144hz
  xrandr --output DP-0 --mode 1920x1080 --rate 144.00
  xrandr --output DP-1 --mode 1920x1080 --rate 144.00
  xrandr --output DP-2 --mode 1920x1080 --rate 144.00
  xrandr --output DP-3 --mode 1920x1080 --rate 144.00
  xrandr --output DP-4 --mode 1920x1080 --rate 144.00
  xrandr --output DP-5 --mode 1920x1080 --rate 144.00

  # after nvidia drivers
  xrandr --output DP-0 --left-of DP-4 --primary
  # before nvidia drivers
  xrandr --output DP-3 --left-of DP-1 --primary

  killall polybar 2> /dev/null

  polybar main &
  polybar secondary &
else
  polybar nanami &
fi

alacritty &
exec bspwm
