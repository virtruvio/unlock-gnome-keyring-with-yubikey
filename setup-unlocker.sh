#!/bin/bash
echo "Starting initilìalisation..."

if [[ $(whoami) != "root" ]];then
        echo "must run as root"
        exit 1
fi

echo "moving the udev rule..."

mv .80-insert-yubi.rules /etc/udev/rules.d/
echo "making scripts executable"
chmod +x unlocker.sh
chmod +x trigger.sh
echo "moving the scripts.."
mv unlocker.sh /usr/local/bin/unlocker
mv trigger.sh /usr/local/bin/trigger
echo "cleaning..."
echo "done!"
