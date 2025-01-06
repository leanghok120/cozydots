#!/bin/bash

# Name of the Polybar process
POLYBAR_PROCESS="polybar"

# Check if Polybar is running
if pgrep -x "$POLYBAR_PROCESS" > /dev/null; then
    echo "Polybar is running, killing it..."
    killall "$POLYBAR_PROCESS"
else
    echo "Starting Polybar..."
    polybar --reload main &
fi
