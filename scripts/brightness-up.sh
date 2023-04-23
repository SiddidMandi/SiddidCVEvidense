#!/bin/bash

brillo -A 4
#increase the screen brightness by 10%
##brightness=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ')
##brightness=$(echo "$brightness + 0.1" | bc)
##
### Make sure the new brightness is within the allowed range
##if [ $(echo "$brightness > 1.5" | bc) -eq 1 ]; then
    ##brightness=1
##elif [ $(echo "$brightness < 0" | bc) -eq 1 ]; then
    ##brightness=0
##fi

# Set the new brightness
#xrandr --output eDP-1 --brightness $brightness
