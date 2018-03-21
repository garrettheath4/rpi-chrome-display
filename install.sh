#!/usr/bin/env bash
# Run this script to install rpi-chrome-display to this computer (Raspberry Pi)
# See README.md file in rpi-chrome-display project for more instructions

echo 'Installing xdotool (if not already installed)...'
sudo apt-get update && sudo apt-get install xdotool

# Make sure this project's autostart snippet is in the user's autostart file
if grep -F 'chromium' ~/.config/lxsession/LXDE-pi/autostart >/dev/null 2>&1; then
	echo "Your ~/.config/lxsession/LXDE-pi/autostart file appears to already"
	echo " contain instructions to start Chromium when you log in."
	echo "Double-check your autostart file to make sure it contains everything"
	echo " in this project's autostart.part file."
else
	echo 'Backing up ~/.config/lxsession/LXDE-pi/autostart file...'
	cp ~/.config/lxsession/LXDE-pi/autostart ~/.config/lxsession/LXDE-pi/autostart.bak
	echo 'Modifying ~/.config/lxsession/LXDE-pi/autostart file...'
	cat autostart.part >> ~/.config/lxsession/LXDE-pi/autostart
fi

echo "Installed. Follow the other steps in this project's README file and then reboot the system."
