#!/bin/bash
power=$(upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage")

status=$(echo $power | tail -n 1 | awk {'print $2'})

if [[ $status == "charging" ]]; then
        percentage=$(echo $power | head -n 1 | awk {'print $9'})
        status2="CHRG"
else
        percentage=$(echo $power | head -n 1 | awk {'print $4'})
        status2="BATT"
fi

echo $status2" ("$percentage")";
