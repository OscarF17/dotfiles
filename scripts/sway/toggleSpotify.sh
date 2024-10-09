#!/usr/bin/bash

if swaymsg -t get_tree | grep 'Spotify';
then
    cur_focus="$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .window_properties.class')"

    if [ "$cur_focus" == "Spotify" ]; then
        swaymsg scratchpad show
    else
        swaymsg [class="Spotify"] focus
    fi
else
    spotify
fi
