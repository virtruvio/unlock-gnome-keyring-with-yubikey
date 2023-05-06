#!/bin/bash
if [[ "$1" == "unlock" ]]; then
	echo -n $2 | gnome-keyring-daemon -r --unlock
	if [[ $? -eq 0 ]];then
		echo "keyring unlocked">>~/keyring-unlocker.log
		notify-send --hint=int:transient:1 "Keyring"  "Unlocked"
	else
		echo "failed to unlock keyring">>~/keyring-unlocker.log
	fi
fi
