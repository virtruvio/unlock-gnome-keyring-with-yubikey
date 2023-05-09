# Unlock your gnome keyring using your yubikey
If you use something else to login into your system then you know that the keyring is not unlocked automatically and you have to enter the password every time, for me it's a frustrating thing to do so I made this script that using a udev rule triggers a script that unlocks the user keyring taking the password from an encrypted file containing the password; There is also the possibility to remove the password, but this means that the keyring will be always unlocked and decrypted, for me this is bad so I use the yubikey,which can store gpg keys; The script is using the gpg-agent, which can use the keys stored on the yubikey to decrypt files, and udev rule as a trigger to decrypt and unlock the user keyring.

## How to Setup
```
git clone https://github.com/iablon/unlock-gnome-keyring-with-yubikey.git
cd unlock-gnome-keyring-with-yubikey
sudo chmod +x setup
sudo ./setup
```
