#!/bin/bash

function powermenu {
	options=" Cancel\n Lock\n󰤄 Sleep\n󰈆 Logout\n Restart\n Shutdown"
	selected=$(echo -e $options | wofi -i -c ~/configs/hypr/wofi/config -s ~/configs/hypr/wofi/style.css  --dmenu)
	if [[ $selected = " Lock" ]]; then
		hyprlock
	elif [[ $selected = "󰤄 Sleep" ]]; then
		systemctl suspend
	elif [[ $selected = "󰈆 Logout" ]]; then
		pkill -u $USER
	elif [[ $selected = " Restart" ]]; then
		reboot
    elif [[ $selected = " Shutdown" ]]; then
		poweroff
	elif [[ $selected = " Cancel" ]]; then
		return
	fi
}


powermenu

