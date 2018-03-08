#!/usr/bin/env bash
# This script is called from ~/.config/lxsession/LXDE-pi/autostart
# Source: https://www.raspberrypi.org/forums/viewtopic.php?t=178206

fullscreen_script=~/rpi-chrome-display/haystack-fullscreen.sh

export DISPLAY=:0.0

while true; do
	# sleep arg is in seconds, so 12 hours = 43200 seconds
	sleep 43200
	xdotool key 'F5'
	if [ -x $fullscreen_script ]; then
		$fullscreen_script
	else
		echo "$(date) - $fullscreen_script script either not found or is not executable" >> ~/autorefresh-chromium.log
	fi
done

