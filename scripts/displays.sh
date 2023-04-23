#displayNumber=$(xrandr | grep -i " connected" | cut -d ' ' -f1 | dmenu) #space before connected
#displayNumber=$(xrandr | awk '/ connected/{print $1}' | dmenu)   #possibly more efficient
displayNumber=$(xrandr --listmonitors | awk '/^\s*[0-9]/ {print $4}' | dmenu -i)  #even more efficient!!
#echo $displayNumber

displayOrientation=$(echo -e "--right-of\n--left-of\n--same-as" | dmenu -i)
#echo $displayOrientation

xrandr --output $displayNumber --auto $displayOrientation eDP-1 --auto
