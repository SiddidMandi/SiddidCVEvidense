#!/bin/bash
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
#to get bus_session_bus_address run echo $DBUS_SESSION_BUS_ADDRESS


trackpad_status=$(xinput list-props "DLL0945:00 06CB:CE26 Touchpad" | grep "Device Enabled" | awk '{print $4}')


if [ $trackpad_status -eq 1 ]; then
    xinput --disable "DLL0945:00 06CB:CE26 Touchpad"
    echo "Trackpad disabled"
    notify-send "Trackpad" "OFF" --expire-time=500
else
    xinput --enable "DLL0945:00 06CB:CE26 Touchpad"
    echo "Trackpad enabled"
    notify-send "Trackpad" "ON" --expire-time=500
fi

