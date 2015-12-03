#!/bin/bash
synergyPID=$(ps aux | grep synergy | grep -v grep | awk {'print $2'})
echo "Synergy PID(s): " $synergyPID
for i in $synergyPID; do
        echo "Killing PID: " $i
        kill -9 $i
done
