#!/usr/bin/bash

if swaymsg -t get_tree | grep 'Thunar';
then
    cur_focus="$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .app_id')"

    if [ "$cur_focus" == "thunar" ]; then
        swaymsg scratchpad show
    else
        swaymsg [app_id="thunar"] focus
    fi
else
    foot -a files lf
fi
