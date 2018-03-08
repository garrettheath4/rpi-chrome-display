#!/usr/bin/env bash
# This script is called from:
# 1) ~/.config/lxsession/LXDE-pi/autostart
# 2) rpi-chrome-display/autorefresh-chromium.sh

export DISPLAY=:0.0

# Wait for the Haystack.tv page to load
sleep 30

# Press Tab key 28 times to select Fullscreen button in video player
for i in {1..28}; do
	xdotool key 'Tab'
done

# Press space to activate the Fullscreen button
xdotool key 'space'
