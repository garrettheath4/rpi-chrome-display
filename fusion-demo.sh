#!/usr/bin/env bash

wait_between_steps=600  # 10 minutes
typing_character_delay_ms=500

# Switch to this script's directory (in case it's called from a different working directory)
cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

# shellcheck disable=SC1091
source utils.sh

./press-tab-13-enter.sh

tab 9  # to name field

sleep $wait_between_steps

xdotool type --delay $typing_character_delay_ms 'My First Workflow Wizard'

sleep $wait_between_steps

tab 4  # to Next button

sleep $wait_between_steps

tab 2  # to second matching field dropdown

sleep $wait_between_steps

xdotool type --delay $typing_character_delay_ms 'last'

sleep $wait_between_steps

./press-enter.sh  # select LAST_NAME field from dropdown

sleep $wait_between_steps

tab 10  # to Next button
./press-enter.sh

sleep $wait_between_steps

tab 14  # to Next button
./press-enter.sh
