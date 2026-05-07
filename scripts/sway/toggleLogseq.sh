#!/usr/bin/bash

CLASS="Logseq"

FOCUSED=$(swaymsg -t get_tree | jq -r ".. | select(.window_properties? .class == \"$CLASS\") | .focused")

if [ "$FOCUSED" == "true" ]; then
    swaymsg "[class=\"$CLASS\"] move scratchpad"
else
    swaymsg "[class=\"$CLASS\"] move container to workspace current"
    swaymsg "[class=\"$CLASS\"] focus"
fi
