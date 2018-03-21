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
1. Reboot the system (into Desktop GUI) using `sudo reboot`
1. Application Menu > Preferences > Raspberry Pi Configuration
    * Check _Login as user 'pi'_
    * Set resolution to 720p or 1080p (CEA mode, for TVs)
1. Clone this repository to the home directory of the `pi` user:

        git clone https://github.com/garrettheath4/rpi-chrome-display.git

1. Run this project's install script

        cd rpi-chrome-display
        ./install.sh

1. In Chromium, click on the _uBlock Origin_ extension icon (to the right of the address bar), click the _Open the dashboard_ button (in the uBlock Origin pop-up menu), go to the _My Filters_ tab, add the following lines to the text box, and click the _Apply changes_ button:

        ! Hide the signup banner at the bottom of the page on https://www.haystack.tv/
        www.haystack.tv###signup-intro

1. Install the [Tampermonkey] extension for Chromium
1. Go to [this URL][HaystackFullVideo] in Chromium to install the _Haystack Full Video_ user script
1. In Chromium, go to Menu > More Tools > [Extensions](chrome://extensions/) and check _Allow in incognito_ next to the [h264ify], [uBlock Origin], and [Tampermonkey] extensions.
1. _Optional:_ Connect the Raspberry Pi to the screen where it will be playing the videos (e.g. digital display, TV, or monitor) and use the [set\_overscan] project on GitHub to set the HDMI [overscan].
1. _Optional:_ Uninstall "bloatware" software that you don't need (it takes up space and slows down updates). See [this project][bloat] for examples of software to remove after a standard Raspian installation.
1. _Optional:_ Read [this article][unattended] to install and configure _unattended-upgrades_
1. Reboot the system using `sudo reboot` to make sure it works


Sources
-------

* [Raspberry Pi Kiosk Screen Tutorial][tutorial] by Dan Purdy
* [Chromium Auto Refresh][script] script



<!-- Links -->
[Tampermonkey]: https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo
[HaystackFullVideo]: https://gist.github.com/garrettheath4/b048bfb9cac5099b9217bfa04d71df10/raw/HaystackFullVideo.user.js
[h264ify]: https://chrome.google.com/webstore/detail/h264ify/aleakchihdccplidncghkekgioiakgal
[uBlock Origin]: https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
[set\_overscan]: https://github.com/ukscone/set_overscan
[overscan]: https://en.wikipedia.org/wiki/Overscan
[bloat]: https://github.com/raspberrycoulis/remove-bloat
[unattended]: https://blog.dantup.com/2016/04/setting-up-automatic-updates-on-raspberry-pi-raspbian-jessie/
[tutorial]: https://www.danpurdy.co.uk/web-development/raspberry-pi-kiosk-screen-tutorial/
[script]: https://www.raspberrypi.org/forums/viewtopic.php?t=178206
