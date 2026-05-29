#!/usr/bin/env bash

DEFAULT_SOUND="/usr/share/sounds/ocean/stereo/dialog-information.oga"
CONFIG="$HOME/.config/notification-sounds/config.toml"
COOLDOWN=2

last_played=0

get_sound_for_urgency() {
    local urgency="$1"
    if [[ -f "$CONFIG" ]]; then
        local line
        line=$(grep -vE '^\s*#' "$CONFIG" | grep -E "^\s*${urgency}\s*=" | head -1)
        if [[ -n "$line" ]]; then
            local path
            path=$(echo "$line" | sed "s/^\s*[^=]*=\s*//" | tr -d '"'"'" | tr -d '[:space:]')
            [[ -n "$path" ]] && echo "$path" && return
        fi
    fi
    echo "$DEFAULT_SOUND"
}

is_dnd_active() {
    gdbus call --session \
        --dest org.freedesktop.Notifications \
        --object-path /org/freedesktop/Notifications \
        --method org.freedesktop.DBus.Properties.Get \
        org.freedesktop.Notifications Inhibited 2>/dev/null \
        | grep -q "true"
}

process_notification() {
    local block="$1"

    is_dnd_active && return

    local now
    now=$(date +%s)
    (( now - last_played < COOLDOWN )) && return
    last_played=$now

    # urgency: 0=low 1=normal 2=critical; default 1 if not present
    local urgency
    urgency=$(echo "$block" | grep -A3 '"urgency"' | grep -o 'byte [0-9]' | grep -o '[0-9]' | head -1)
    urgency="${urgency:-1}"

    local sound
    sound=$(get_sound_for_urgency "$urgency")

    [[ -f "$sound" ]] && paplay "$sound" 2>/dev/null &
}

dbus-monitor "type='method_call',interface='org.freedesktop.Notifications',member='Notify'" | {
    block=""
    while IFS= read -r line; do
        if [[ "$line" == method\ call\ * ]]; then
            block="$line"
        elif [[ -n "$block" ]]; then
            block+=$'\n'"$line"
            # Notify's signature is (susssasa{sv}i) — int32 is always the last arg
            if [[ "$line" =~ ^[[:space:]]+int32[[:space:]] ]]; then
                process_notification "$block"
                block=""
            fi
        fi
    done
}
