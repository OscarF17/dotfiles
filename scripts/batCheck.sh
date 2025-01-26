#!/bin/sh

BATTERIES=$(ls /sys/class/power_supply/ | grep -c BAT)

# Only run if system has batteries
if [ $BATTERIES != '0' ]; then
    LAST="NONE"
    LOW=20
    CRITICAL=10
    while true; do
        TOTAL_CAPACITY=0
        CHARGING='FALSE'

        for ((i=0; i<BATTERIES; i++)); do
            CAPACITY=$(cat /sys/class/power_supply/BAT$i/capacity)
            BAT_STATUS=$(cat /sys/class/power_supply/BAT$i/status)
            TOTAL_CAPACITY=$((TOTAL_CAPACITY + CAPACITY))
            # Laptop charges one battery at a time so I only need to find one
            if [ "$BAT_STATUS" = 'Charging' ]; then
                CHARGING='TRUE'
            fi
        done        
        AVERAGE_CAPACITY=$((TOTAL_CAPACITY / BATTERIES))

        if [ "$CHARGING" = "FALSE" ]; then
            if [ $AVERAGE_CAPACITY -le $CRITICAL ]; then
                if [ $LAST != 'CRIT' ]; then
                    notify-send -i battery-level-10-symbolic "BATTERY CRITICAL" "Battery at ${AVERAGE_CAPACITY}%"
                    LAST='CRIT'
                fi

            elif [ $AVERAGE_CAPACITY -le $LOW ]; then
                if [ $LAST != 'LOW' ]; then
                    notify-send -i battery-level-20-symbolic "LOW BATTERY" "Battery at ${AVERAGE_CAPACITY}%"
                    LAST='LOW'
                fi
            fi
        else
            LAST='NONE'
        fi
        # Check every 5 minutes
        sleep 500
    done
fi
