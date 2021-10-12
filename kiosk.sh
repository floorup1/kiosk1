#!/bin/bash

# sudo apt-get update -y
# sudo apt-get upgrade -y
sudo curl -o /opt/kiosk.sh https://raw.githubusercontent.com/floorup1/kiosk1/master/kiosk.sh
sudo curl -o /etc/sudoers https://raw.githubusercontent.com/floorup1/kiosk1/main/sudoers
# sudo rm -rf /home/kiosk-user/share/*
sudo rm -rf startpage
sudo curl -LOk https://github.com/floorup1/startpage/archive/master.zip
unzip -o master.zip
sudo cp -r startpage-master startpage
xset -dpms
xset s off
openbox-session &
start-pulseaudio-x11

while true; do
sudo curl -o /etc/chromium/policies/managed/policy.json https://raw.githubusercontent.com/floorup1/kiosk/master/policy.json
rm -rf /home/kiosk-user/.config/chromium/*
rm -rf /home/kiosk-user/.cache/chromium/*
chromium --start-maximized 'file:///home/kiosk-user/startpage/start.html'
done
