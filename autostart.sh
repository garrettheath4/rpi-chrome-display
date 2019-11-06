# Set the screensaver to not just be a blank screen
xset s noblank
# Turn the screensaver off
xset s off
# Disable energy star features
xset -dpms
# Hide the banner to restore the previous Chromium browser session if there was an unexpected shutdown
sed --in-place=bak -e 's/"exited_cleanly": \?false/"exited_cleanly":true/' -e 's/"exit_type": \?Crashed/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
# Start Chromium in kiosk mode
url_to_open=$(cat "$HOME/rpi-chrome-display/url.txt")
chromium-browser --noerrdialogs --kiosk ${url_to_open:-http://www.google.com/} --incognito
