#!/bin/bash
echo "Starting initilìalisation..."
echo "moving the udev rule..."
mv .80-insert-yubi.rules /etc/udev/rules.d/
echo "moving the scripts.."
mv .unlocker.sh /usr/local/bin
mv .trigger.sh /usr/local/bin
echo "cleaning..."
echo "done!"
