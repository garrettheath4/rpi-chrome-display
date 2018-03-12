#!/usr/bin/env bash
# Run this script to install rpi-chrome-display to this computer (Raspberry Pi)
# See README.md file in rpi-chrome-display project for more instructions

# Make sure xdotool is installed
sudo apt-get update && sudo apt-get install xdotool

# Make this project's autostart file the system's autostart script
if [ ! -L ~/.config/lxsession/LXDE-pi/autostart ]; then
	if [ -e ~/.config/lxsession/LXDE-pi/autostart ]; then
		mv ~/.config/lxsession/LXDE-pi/autostart ~/.config/lxsession/LXDE-pi/autostart.bak
	fi
	if [ ! -e ~/.config/lxsession/LXDE-pi/autostart ]; then
		ln -s "$(pwd)/autostart" ~/.config/lxsession/LXDE-pi/autostart
	else
		echo 'ERROR: ~/.config/lxsession/LXDE-pi/autostart still exists. Rename it and re-run this script. Exiting.'
		exit 1
	fi
else
	echo "Warning: ~/.config/lxsession/LXDE-pi/autostart is already a link. File not relinked because it's probably already linked to this project's autostart file."
	exit 0
fi

echo "Installed. Follow the other steps in this project's README file and then reboot the system."
