tab () {
	# Usage: tab <num_times>
	num_times=1
	if [ $# -ge 0 ]; then
		num_times=$1
	fi
	for ((i=0; i<num_times; i++)); do
		xdotool key Tab
	done
}
