# vi:syntax=sh

# Thinkpad Extreme X1 gen 2th
# acceleration
xinput set-prop 'Synaptics TM3512-010' 'libinput Accel Speed' 0.9
# right click with two fingers
xinput set-prop 'Synaptics TM3512-010' 'libinput Click Method Enabled' 0 1 
# tap to click
xinput set-prop 'Synaptics TM3512-010' 'libinput Tapping Enabled' 1

# xinput set-prop 'Logitech Wireless Mouse MX Master 3' 

export MONITOR=DP-2
export DEFAULT_NETWORK_INTERFACE=wlp82s0

# export QT_AUTO_SCREEN_SCALE_FACTOR=0
# export QT_SCALE_FACTOR=2

# discrete graphic only
# export QT_AUTO_SCREEN_SCALE_FACTOR=1

# optimus
# export QT_SCALE_FACTOR=2
