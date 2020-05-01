#!/usr/bin/env zsh

alias airpodsc="osascript $DOTFILES_DIR/automation/connectAirPods.scpt"

airpods_status() {
    batteryLeft=$(defaults read /Library/Preferences/com.apple.Bluetooth | grep BatteryPercentLeft | tr -d \; | awk '{print $3}')
    batteryRight=$(defaults read /Library/Preferences/com.apple.Bluetooth | grep BatteryPercentRight | tr -d \; | awk '{print $3}')
    batteryCase=$(defaults read /Library/Preferences/com.apple.Bluetooth | grep BatteryPercentCase | tr -d \; | awk '{print $3}')

    echo "L: $batteryLeft% P: $batteryRight% Case: $batteryCase%"
}
