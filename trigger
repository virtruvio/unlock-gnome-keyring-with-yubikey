#!/bin/bash
# pin=manual
user=jay
userid=1000
# systemctl restart pcscd
# killall gpg-agent

#get pass
#detect mount
while ! grep -q /media/Invoices </proc/mounts; do
	sleep 1
done
pass=$(head -n 1 /media/Invoices/.udev/.hpc)

if [[ "$1" == "add" ]]; then
  	echo "Device-Added">>/home/$user/.keyring-unlocker.log
		envo="XDG_RUNTIME_DIR=\"/run/user/$userid\" DBUS_SESSION_BUS_ADDRESS=\"unix:path=/run/user/$userid/bus\" /usr/local/bin/keyring-unlock unlock $pass $user"
		su -c "$envo" $user
elif [[ "$1" == "remove" ]]; then
  echo "Device-Removed">>/home/$user/.keyring-unlocker.log
else
  echo "Error: Invalid argument provided">>/home/$user/.keyring-unlocker.log
  exit 1
fi
