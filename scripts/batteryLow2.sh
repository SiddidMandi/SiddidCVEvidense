export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
#to get bus_session_bus_address run echo $DBUS_SESSION_BUS_ADDRESS

battery_percentage=$(acpi | awk 'match($0, /Battery 1: Charging, ([0-9]+)%,/, a) {print a[1]}' | tr -d '\r')
battery_percentage0=$(acpi | awk 'match($0, /Battery 0: Charging, ([0-9]+)%,/, a) {print a[1]}' | tr -d '\r')

#echo "battery_percentage" $battery_percentage

if [ "$battery_percentage" -lt 25 ] || [ "$battery_percentage0" < 25 ]; then
	notify-send "CHARGE ME CUNT" "BATTERY LOW"
fi
