#!/usr/bin/env bash
# Run this script to install rpi-chrome-display to this computer (Raspberry Pi)
# See README.md file in rpi-chrome-display project for more instructions

# apt installs
if ! ( dpkg -s xdotool >/dev/null 2>&1 || dpkg -s unclutter >/dev/null 2>&1 ); then
	echo 'Installing xdotool and unclutter...'
	sudo apt update && sudo apt install xdotool unclutter -y
fi

# start
if grep -F 'start.sh' ~/.config/lxsession/LXDE-pi/autostart >/dev/null 2>&1; then
	echo "Your ~/.config/lxsession/LXDE-pi/autostart file appears to already"
	echo "contain the start.sh script from this project."
	echo "Double-check your autostart file to ensure it includes the following line:"
	echo
	echo "  @$PWD/start.sh"
	echo
else
	if [ -e "$HOME/.config/lssession/LXDE-pi/autostart" ]; then
		echo 'Backing up ~/.config/lxsession/LXDE-pi/autostart file...'
		cp ~/.config/lxsession/LXDE-pi/autostart ~/.config/lxsession/LXDE-pi/autostart.bak
	fi
	mkdir -p ~/.config/lxsession/LXDE-pi
	echo 'Modifying ~/.config/lxsession/LXDE-pi/autostart file...'
	echo "@$PWD/start.sh" >> ~/.config/lxsession/LXDE-pi/autostart
fi

# crontab
	if crontab -l | grep -F 'refresh-chromium.sh' >/dev/null 2>&1; then
		echo "Your crontab appears to already have the refresh-chromium.sh script in it."
		echo "Double-check your crontab file by running 'crontab -e'"
	else
		if crontab -l >/dev/null 2>&1; then
			echo "Appending to end of your crontab"
		else
			echo "Creating your crontab file"
		fi
		( crontab -l ; cat crontab ) | crontab -
	fi

echo "Installed. Follow the other steps in this project's README file and then reboot the system."
