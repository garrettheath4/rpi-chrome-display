#!/usr/bin/env bash

# Switch to this script's directory (in case it's called from a different working directory)
cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

# shellcheck disable=SC1091
source utils.sh

num_tabs=13

export DISPLAY=':0.0'

tab $num_tabs

xdotool key Return
