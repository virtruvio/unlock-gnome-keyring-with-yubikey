#!/bin/bash
if [[ "$1" == "unlock" ]]; then
	echo -n $2 | gnome-keyring-daemon -r --unlock
	if [[ $? -eq 0 ]];then
		echo "keyring unlocked">>/home/hak/projects/scripts/arg
		notify-send --hint=int:transient:1 "Keyring"  "Unlocked"
	else
		echo "failed to unlock keyring">>/home/hak/projects/scripts/arg
	fi
fi
