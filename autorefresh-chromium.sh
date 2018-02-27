#!/usr/bin/env bash
# This script is called from ~/.config/lxsession/LXDE-pi/autostart
# Source: https://www.raspberrypi.org/forums/viewtopic.php?t=178206
while true; do
	# sleep arg is in seconds, so 12 hours = 43200 seconds
	sleep 43200
	xdotools key="ctrl+F5" &
done

