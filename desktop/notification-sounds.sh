#!/usr/bin/env bash

dbus-monitor "type='method_call',interface='org.freedesktop.Notifications',member='Notify',arg0='Morgen'" | while read msg; do
    if echo "$msg" | grep -q "^method call "; then
        paplay "/usr/share/sounds/ocean/stereo/dialog-information.oga"
    fi
done