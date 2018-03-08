#!/usr/bin/env bash
#
# Usage: ./haystack-fullscreen.sh [DelayInSeconds]
#
# This script is called from:
# 1) ~/.config/lxsession/LXDE-pi/autostart
# 2) rpi-chrome-display/autorefresh-chromium.sh

mouse_x=680
mouse_y=540
delay=45

export DISPLAY=:0.0

if [ $# -ge 1 ]; then
	delay="$1"
fi

# Wait for the Haystack.tv page to load
sleep "$delay"

# Move mouse to Fullscreen button in video player
xdotool mousemove --sync $mouse_x $mouse_y

# Click Fullscreen button in video player
xdotool click 1

# Move mouse again to make "Fullscreen" hover text from button (if any) go away
xdotool mousemove $mouse_x $mouse_y
