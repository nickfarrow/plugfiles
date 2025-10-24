#!/bin/bash

STATE_FILE="/tmp/mullvad_disconnect_time"

case "$1" in
    status)
        if [ -f "$STATE_FILE" ]; then
            disconnect_time=$(cat "$STATE_FILE")
            current_time=$(date +%s)
            elapsed=$((current_time - disconnect_time))
            remaining=$((60 - elapsed))
            
            if [ $remaining -le 10 ]; then
                echo "%{F#ff0000}Disconnected (${remaining}s)%{F-}"
            else
                echo "Disconnected (${remaining}s)"
            fi
        else
            status=$(mullvad status | grep -oE '[^ ]+$' | awk 'NR==1{print}')
            echo "$status"
        fi
        ;;
    toggle)
        if mullvad status | grep -q "Connected"; then
            mullvad disconnect
            date +%s > "$STATE_FILE"
            (sleep 60; mullvad connect; rm -f "$STATE_FILE") &
        else
            # Manual reconnect - cancel timer
            pkill -f "sleep 60.*mullvad connect"
            rm -f "$STATE_FILE"
            mullvad connect
        fi
        ;;
esac
