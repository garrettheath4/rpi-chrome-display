Raspberry Pi Chrome Display
===========================

The purpose of this project is to provide instructions on how to have a
Raspberry Pi boot up to a full-screen web page in the Chromium web browser.


Instructions
------------

1. Install Raspbian on your Raspberry Pi
1. Use `sudo raspi-config` command to configure the system:
    * Update to make sure you have the latest script
    * Set new password for default `pi` user
    * Network
        * Set hostname
        * Auto-connect to Wi-Fi network (if not using wired ethernet)
    * Boot to Desktop GUI
    * Localisation
        * Set locale to `en_US.UTF-8 UTF-8`
        * Set timezone
        * Set keyboard layout
            * Keyboard: _Generic 104-key PC_
            * Layout: _Other: English (US)_
            * AltGr: _default_
            * Compose key: _No compose key_
            * Use Control+Alt+Backspace to terminate the X server: _No_
    * Interfacing Options: Enable SSH (if desired)
    * Advanced: Expand Filesystem
1. Install `xdotools` by running `sudo apt-get install xdotools`
1. Reboot the system (into Desktop GUI) using `sudo reboot`
1. Application Menu > Preferences > Raspberry Pi Configuration
    * Check _Login as user 'pi'_
    * Set resolution to 720p or 1080p (CEA mode, for TVs)
1. Clone this repository to the home directory of the `pi` user:

        git clone https://github.com/garrettheath4/rpi-chrome-display.git

1. Edit `~/.config/lxsession/LXDE-pi/autostart` file
    * Comment out `@xscreensaver -no-splash` line by prepending it with `#`
    * Add the following lines (replace `https://www.haystack.tv` with your own desired URL; see `autostart` file in repo for full example file):

            @xset s off
            @xset -dpms
            @xset s noblank
            @sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' ~/.config/chromium/Default/Preferences
            @chromium-browser --noerrdialogs --kiosk https://www.haystack.tv/
            @/home/pi/rpi-chrome-display/autorefresh-chromium.sh
            @/home/pi/rpi-chrome-display/haystack-fullscreen.sh

1. Reboot the system using `sudo reboot` to make sure it works


Sources
-------

* [Raspberry Pi Kiosk Screen Tutorial][tutorial] by Dan Purdy
* [Chromium Auto Refresh][script] script


<!-- Links -->
[tutorial]: https://www.danpurdy.co.uk/web-development/raspberry-pi-kiosk-screen-tutorial/
[script]: https://www.raspberrypi.org/forums/viewtopic.php?t=178206
