#!/usr/bin/env bash

num_tabs=13

export DISPLAY=':0.0'

for ((i=0; i<num_tabs; i++)); do
	xdotool key Tab
done

xdotool key Return
