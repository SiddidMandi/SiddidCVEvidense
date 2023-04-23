#!/bin/zsh
#paths must be absolute
function inputDevs {
	selected=$(echo -e "pentablet\nDisplayOrientation\nSecondDisplayBri\nRedshift\nSlock\nman" | dmenu -i -p "Options")
	#echo $selected
	if [[ $selected = "pentablet" ]]; then
		/home/siddid/scripts/pentablet.sh
	elif [[ $selected = "DisplayOrientation" ]]; then
		/home/siddid/scripts/displays.sh
	elif [[ $selected = "SecondDisplayBri" ]]; then
		brightness
	elif [[ $selected = "Slock" ]]; then
		slock
	elif [[ $selected = "Redshift" ]]; then
		redshift -O 6000K -b 1
	elif [[ $selected = "man" ]]; then
		/home/siddid/scripts/mansplain.sh
	fi
}

function brightness {
	selected=$(echo -e "1.2\n1\n0.9\n0.8\n0.7\n0.6\n0.5\n0.4" | dmenu -i -p "Brightnesses")
	if [[ $selected = "1.1" ]]; then
		xrandr --output DP-1-2 --brightness 1.2
	elif [[ $selected = "1" ]]; then
		xrandr --output DP-1-2 --brightness 1
	elif [[ $selected = "0.9" ]]; then
		xrandr --output DP-1-2 --brightness .9
	elif [[ $selected = "0.8" ]]; then
		xrandr --output DP-1-2 --brightness .8
	elif [[ $selected = "0.7" ]]; then
		xrandr --output DP-1-2 --brightness .7
	elif [[ $selected = "0.6" ]]; then
		xrandr --output DP-1-2 --brightness .6
	elif [[ $selected = "0.5" ]]; then
		xrandr --output DP-1-2 --brightness .5
	elif [[ $selected = "0.4" ]]; then
		xrandr --output DP-1-2 --brightness .4
	fi
}

inputDevs
