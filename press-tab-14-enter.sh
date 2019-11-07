#!/usr/bin/env bash

num_tabs=14

for ((i=0; i<num_tabs; i++)); do
	xdotool key Tab
done

xdotool key Return
