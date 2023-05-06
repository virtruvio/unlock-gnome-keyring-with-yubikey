#!/bin/bash
systemctl restart pcscd
killall gpg-agent
if [[ "$1" == "add" ]]; then
  		echo "Device added">>/home/hak/projects/scripts/arg
		if gpg --card-status ;then
			echo "detected->decrypting">>/home/hak/projects/scripts/arg
			pass=$(gpg -q --pinentry-mode loopback --passphrase "327551" --decrypt /home/hak/projects/scripts/pswd.gpg)
  			su -c 'XDG_RUNTIME_DIR="/run/user/1000" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" sh /home/hak/projects/scripts/u.sh unlock'" $pass" hak 
		else
			echo "detection fail">>/home/hak/projects/scripts/arg
		fi
elif [[ "$1" == "remove" ]]; then
  echo "Device removed">>/home/hak/projects/scripts/arg
  su -c 'XDG_RUNTIME_DIR="/run/user/1000" DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" sh /home/hak/projects/scripts/u.sh lock' hak
else
  echo "Error: Invalid argument provided">>/home/hak/projects/scripts/arg
  exit 1
fi
