#!/bin/zsh


update_info() {
  global net_status net_speed ram_used battery_percent
  # Get network interface name
  interface=$(ip route | grep default | awk '{print $5}')

  # Check for network connectivity
  if ping -q -c 1 -W 1 8.8.8.8 > /dev/null; then
    # Get network speed in KiloBytes
    rx_bytes=$(grep "$interface" /proc/net/dev | awk '{print $2}')
    tx_bytes=$(grep "$interface" /proc/net/dev | awk '{print $10}')
    net_speed=$((($rx_bytes + $tx_bytes) / 1000))
    net_speed=$(numfmt --grouping $net_speed)

    net_status="直"
  else
    net_speed="睊"
    net_status="睊"
  fi
  # Get ram used in Kilobytes
  total=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
  free=$(awk '/MemFree/ {print $2}' /proc/meminfo)
  buffers=$(awk '/Buffers/ {print $2}' /proc/meminfo)
  cache=$(awk '/Cached/ {print $2}' /proc/meminfo| head -n1)
  ram_used="$(((total-free-buffers-cache)/1000))"

  # Get battery percentage
  battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)
  #echo "function executed"
  xsetroot -name "Net: $net_speed KB/s $net_status | RAM: $ram_used MB | Battery: $battery_percent% | $date | $time "
}

while true; do
  update_info
  sleep 5
done &


while true; do
  # Get current date and time in 24 hour format
  date=$(date +"%Y-%m-%d")
  time=$(date +"%H:%M")
  # Set the root window name
  xsetroot -name "Net: $net_speed KB/s $net_status | RAM: $ram_used MB | Battery: $battery_percent% | $date | $time "
#echo "update_info here:" $net_speed $battery_percent $ram_used
  # Sleep for 1 second
  sleep 1
done

