#!/usr/bin/bash

CLASS="Spotify"
EXEC="spotify-launcher"

RUNNING=$(swaymsg -t get_tree | jq -r ".. | select(.window_properties? .class == \"$CLASS\") | .class" | head -n 1)

if [ -z "$RUNNING" ]; then
    $EXEC &
else
    FOCUSED=$(swaymsg -t get_tree | jq -r ".. | select(.window_properties? .class == \"$CLASS\") | .focused")
    if [ "$FOCUSED" == "true" ]; then
        swaymsg "[class=\"$CLASS\"] move scratchpad"
    else
        swaymsg "[class=\"$CLASS\"] move container to workspace current"
        swaymsg "[class=\"$CLASS\"] focus"
    fi
fi
