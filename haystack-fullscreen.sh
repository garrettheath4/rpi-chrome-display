#!/usr/bin/env bash
# This script is called from:
# 1) ~/.config/lxsession/LXDE-pi/autostart
# 2) rpi-chrome-display/autorefresh-chromium.sh

export DISPLAY=:0.0

# Wait for the Haystack.tv page to load
sleep 45

# Move mouse to Fullscreen button in video player
xdotool mousemove --sync 680 540

# Click Fullscreen button in video player
xdotool click 1

# Move mouse again to make "Fullscreen" hover text from button (if any) go away
xdotool mousemove 680 540
