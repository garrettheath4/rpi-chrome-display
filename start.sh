#!/usr/bin/env bash

# Set the screensaver to not just be a blank screen
xset s noblank
# Turn the screensaver off
xset s off
# Disable energy star features
xset -dpms

# Make sure the GUI is showing on the screen
sudo chvt 9 && sudo chvt 7

# Unlock the Chromium profile in case it did not shutdown/unlock properly
rm "$HOME/.config/chromium/Singleton*"
# Hide the banner to restore the previous Chromium browser session if there was an unexpected shutdown
sed --in-place=.bak -e 's/"exited_cleanly": \?false/"exited_cleanly":true/' -e 's/"exit_type": \?"Crashed"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

# Decide which URL to open with Chromium
url_to_open=$(cat "$HOME/rpi-chrome-display/url.txt")

# Start Chromium in kiosk mode in a background process
DISPLAY=':0.0' chromium-browser --noerrdialogs --kiosk "${url_to_open:-http://www.google.com/}" &

# Wait for the login page to load and press Enter
sleep 30 && "$HOME/rpi-chrome-display/press-enter.sh"
