#!/usr/bin/env bash
# This script is called from:
# 1) ~/.config/lxsession/LXDE-pi/autostart
# 2) rpi-chrome-display/autorefresh-chromium.sh

export DISPLAY=:0.0

# Wait for the Haystack.tv page to load
sleep 30

# Move mouse somewhere into video on page
xdotool mousemove --sync 300 300

# Double-click video to make it fullscreen
xdotool click --repeat 2 1
