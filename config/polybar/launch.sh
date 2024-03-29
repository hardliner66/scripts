#!/bin/sh

# export MONITOR=$(xrandr | grep -i DP | grep -iw connected | cut -d ' ' -f 1)
# export MONITOR=DP-0.3
# export MONITOR=eDP-1.1
export MONITOR=eDP-1

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar example

echo "Bars launched..."
