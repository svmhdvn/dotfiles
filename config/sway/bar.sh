#!/bin/sh

# SIVA: this is the battery fuel gauge driver. Currently set for
# the pinebook pro
battery_driver=BAT0

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# # like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

battery_capacity=$(cat /sys/class/power_supply/$battery_driver/capacity)
battery_status=$(cat /sys/class/power_supply/$battery_driver/status)
battery_info="Battery: $battery_capacity% ($battery_status)"

echo $battery_info '|' $date_formatted
