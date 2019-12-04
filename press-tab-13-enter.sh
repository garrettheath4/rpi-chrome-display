#!/usr/bin/env bash

# shellcheck disable=SC1091
source utils.sh

num_tabs=13

export DISPLAY=':0.0'

tab $num_tabs

xdotool key Return
