TOUCHPAD_ID=$(hyprctl devices | grep -A 10 touchpad | grep -m 1 "elan0" | awk -F '-' '{print $1 $2}' | awk '{$1=$1};1')

if [ -n "$TOUCHPAD_ID" ]; then
    CURRENT_STATE=$(hyprctl getoption "device:[$TOUCHPAD_ID]:enabled" | grep "int:" | awk '{print $2}')
    
    if [ "$CURRENT_STATE" = "1" ]; then
        hyprctl keyword "device:$TOUCHPAD_ID:enabled" false
        notify-send "Touchpad" "Disabled"
    else
        hyprctl keyword "device:[$TOUCHPAD_ID]:enabled" true
        notify-send "Touchpad" "Enabled"
    fi
else
    notify-send "Touchpad" "Not found"
fi
