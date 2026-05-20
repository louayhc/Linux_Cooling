#!/bin/bash

# Script: power_toggle.sh
# Usage: ./power_toggle.sh [start|stop]

PID_FILE="/tmp/power_toggle.pid"

# The main toggle function
toggle_loop() {
    while true; do
        powerprofilesctl set balanced
        sleep 1.5
        powerprofilesctl set performance
        sleep 1.5
    done
}

# Start background process
if [ "$1" = "start" ]; then
    if [ -f "$PID_FILE" ]; then
        echo "Already running (PID: $(cat $PID_FILE))"
        exit 1
    fi
    
    # Start in background
    toggle_loop &
    echo $! > "$PID_FILE"
    echo "Started in background (PID: $!)"

# Stop background process
elif [ "$1" = "stop" ]; then
    if [ -f "$PID_FILE" ]; then
        kill $(cat "$PID_FILE") 2>/dev/null
        rm "$PID_FILE"
        powerprofilesctl set balanced
        echo "Stopped and reset to balanced"
    else
        echo "Not running"
    fi

# Run in foreground (original behavior)
else
    echo "Running in foreground (Ctrl+C to stop)"
    echo "Use '$0 start' for background or '$0 stop' to stop"
    toggle_loop
fi
