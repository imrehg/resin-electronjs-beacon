#!/bin/bash

# using local electron module instead of the global electron lets you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X istance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs

echo "Attaching hci0..."
if ! /usr/bin/hciattach /dev/ttyAMA0 bcm43xx 921600 noflow -; then
    echo "First try failed. Let's try another time."
    /usr/bin/hciattach /dev/ttyAMA0 bcm43xx 921600 noflow -
fi

rm /tmp/.X0-lock &>/dev/null || true
startx /usr/src/app/node_modules/electron/dist/electron /usr/src/app --enable-logging
