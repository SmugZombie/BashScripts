#!/bin/bash
# fancontrol.sh v0.1
# github.com/smugzombie
# To be run via minute cron to update the laptops fan speed if not functioning properly on its own
# Requires: https://github.com/lavoiesl/osx-cpu-temp

# uses osx-cpu-temp to return the current temperature
getCurrentTemp()
{
	#get the current temp
	CURR_TEMP=$(/usr/local/bin/osx-cpu-temp)
	#substring off the last chars
	CURR_TEMP=${CURR_TEMP:0:2}
}

# Change the fan speed based upon the given input
changeFanSpeed()
{
	/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mn -w "$1"e0
}

# Get the current Temperature
getCurrentTemp

# Adjust fan speed as required
if [[ "$CURR_TEMP" -gt "60" ]]
then
	changeFanSpeed 60
elif [[ "$CURR_TEMP" -gt "55" ]]
then
	changeFanSpeed 45
elif [[ "$CURR_TEMP" -gt "50" ]]
then
        changeFanSpeed 30
else
	changeFanSpeed 20
fi
