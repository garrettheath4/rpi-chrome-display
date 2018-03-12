#!/usr/bin/env bash
# This script is called from ~/.config/lxsession/LXDE-pi/autostart
# Source: https://www.raspberrypi.org/forums/viewtopic.php?t=178206

export DISPLAY=:0.0

while true; do
	# sleep arg is in seconds, so 12 hours = 43200 seconds
	sleep 43200
	xdotool key 'F5'
done

