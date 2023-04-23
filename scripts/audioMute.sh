for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-)
do
  pactl set-sink-mute $SINK toggle
done

pacmd list-sinks | awk '/muted/ { print $2 }' | head -n1

muted=$(pacmd list-sinks | awk '/muted/ { print $2 }' | head -n1)

#notify-send "AUDIO $muted" --expire-time=500

if [ "$muted" = "yes" ]; then
	notify-send "Audio MUTED" " " --expire-time=500
else
	notify-send "Audio ON" " " --expire-time=500
fi
