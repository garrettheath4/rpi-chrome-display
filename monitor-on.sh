#!/usr/bin/env bash

export DISPLAY=':0.0'

xset -dpms
sleep 2
tvservice -p
sleep 2
sudo chvt 9 && sudo chvt 7
