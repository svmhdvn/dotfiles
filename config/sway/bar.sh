#!/bin/sh

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# # like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_info="Battery: $battery_capacity% ($battery_status)"

echo $battery_info '|' $date_formatted
