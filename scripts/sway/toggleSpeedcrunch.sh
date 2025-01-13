#!/usr/bin/bash

if swaymsg -t get_tree | grep 'speedcrunch';
then
    cur_focus="$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .app_id')"

    if [ "$cur_focus" == "org.speedcrunch.speedcrunch" ]; then
        swaymsg scratchpad show
    else
        swaymsg [app_id="org.speedcrunch.speedcrunch"] focus
    fi
else
    speedcrunch
fi
