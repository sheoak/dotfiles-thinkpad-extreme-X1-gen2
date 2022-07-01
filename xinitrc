# vi:syntax=sh

# local vars
export DEFAULT_NETWORK_INTERFACE=wlp82s0

# check if optimus is on
xrandr | grep eDP-1 | grep -q " connected"
IS_DISCRETE=$?

if [ $IS_DISCRETE -eq 0 ]; then
    export MONITOR='eDP-1'
    export MONITOR_EXT='DP-1-0'
    export MONITOR_EXT_2='DP-1-1'

    [[ -f $DOTFILES_LOCAL/Xresources.optimus ]] && xrdb -merge $DOTFILES_LOCAL/Xresources.optimus
else
    export MONITOR='DP-2'
    export MONITOR_EXT='DP-1.3'
    export MONITOR_EXT_2='DP-1.1'

    [[ -f $DOTFILES_LOCAL/Xresources.discrete ]] && xrdb -merge $DOTFILES_LOCAL/Xresources.discrete
fi

xrandr | grep $MONITOR_EXT | grep -q " connected"
IS_SINGLE_MONITOR=$?

if [ $IS_SINGLE_MONITOR -eq 0 ]; then

    # autorandr --load external-discrete
    [[ -f $DOTFILES_LOCAL/Xresources.dual ]] && xrdb -merge $DOTFILES_LOCAL/Xresources.dual

    # change firefox dpi
    /home/sheoak/bin/set_firefox_dpi.sh 1

else

    [[ -f $DOTFILES_LOCAL/Xresources.mono ]] && xrdb -merge $DOTFILES_LOCAL/Xresources.mono

    /home/sheoak/bin/set_firefox_dpi.sh 2

fi

# Thinkpad Extreme X1 gen 2th
# acceleration
xinput set-prop 'Synaptics TM3512-010' 'libinput Accel Speed' 0.9
# right click with two fingers
xinput set-prop 'Synaptics TM3512-010' 'libinput Click Method Enabled' 0 1
# tap to click
xinput set-prop 'Synaptics TM3512-010' 'libinput Tapping Enabled' 1

# xinput set-prop 'Logitech Wireless Mouse MX Master 3' 

# discrete graphic only
if [ $IS_SINGLE_MONITOR -eq 0 ]; then

    # dual monitor
    # export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_SCALE_FACTOR=1
    export QT_AUTO_SCREEN_SCALE_FACTOR=0

else
    # oled integrated monitor, 4K
    # export QT_AUTO_SCREEN_SCALE_FACTOR=2
    export QT_SCALE_FACTOR=2
    export QT_AUTO_SCREEN_SCALE_FACTOR=0
fi
