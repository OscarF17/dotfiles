#!/usr/bin/bash

if swaymsg -t get_tree | grep 'Logseq';
then
    cur_focus="$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .name')"

    if [ "$cur_focus" == "Logseq" ]; then
        swaymsg scratchpad show
    else
        swaymsg [class="Logseq"] focus
    fi
else
    logseq
fi
