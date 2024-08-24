#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("Lock" "Logout" "Reboot" "Shutdown" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Lock")
						i3lock -i ~/Pictures/Tranquility.png
            ;;
        "Logout")
						pkill -u $USER
            ;;
        "Reboot")
						reboot
            ;;
        "Shutdown")
						shutdown -h now
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

