#!/bin/bash
# MacSalt
# regl2 - ron.egli@tvrms.com
# Version 2.1

# Get arguments
while getopts ":h:c:s:" opt; do
  case $opt in
    h) host="$OPTARG"
    ;;
    c) command="$OPTARG"
    ;;
    s) sudo=true
	;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

# Check for Sudo Flag
sudo=false
if [[ "$@" == *"-s"* ]];then
  sudo=true
fi

if [ -z "$host" ] || [ -z "$command" ]; then
	echo "Missing Arguments: "
	echo "  -h = Host        "
	echo "     Usage: -h 10.0.0.1"
	echo "  -c = Command     "
	echo "     Usage: -h 10.0.0.1 -c who "
	echo "  -s = Sudo  "
	echo "     Usage: -h 10.0.0.1 -c who -s"
	echo "Extra Options:                   "
	echo "  test.ping (as command)         "
	echo "     -Performs a simple ping on the host(s)"
	echo "     Usage: -h 10.0.0.1 -c test.ping       "
	echo "  checkUpdates (as command)      "
	echo "     -Performs SoftwareUpdate -l on the host(s)"
	echo "  getUpdates (as command) "
	echo "     -Performs SoftwareUpdate -i -a on the host(s)"
	exit
fi

hosts=( "soc1" "soc2" "soc3" "soc4" "soc5" "socserver" )

function runCommand {
	host=$1
	command=$2
	output=$(ssh regli2@$host $command)
	echo -e "\e[91m$host\e[0m"
	echo -e "$output"
}

function runCommandSudo {
	host=$1
	command=$2
	output=$(ssh root@$host $command)
	echo $output
	echo -e "\e[91m$host\e[0m - SUDO"
	echo -e "$output"
}

function pingmachine {
	host=$1
	status=$(timeout 3 ping soc1 -n 1 | grep Received | awk {'print $7'} | awk -F "," {'print $1'})
	echo -e "\e[91m$host\e[0m - Ping Test"
	if [ "$status" == "1" ]; then
		echo -e "Online"
	else
		echo -e "Offline"
	fi
}

function runAll {
	for i in "${hosts[@]}"
	do
	  :
	  	host=$i
		command=$1
		output=$(ssh regli2@$host $command)
		echo -e "\e[91m$i\e[0m"
		echo -e "$output"
	done
}

function runAllSudo {
	for i in "${hosts[@]}"
	do
	  :
	  	host=$i
		command=$1
		output=$(ssh root@$host $command)
		echo -e "\e[91m$i\e[0m - SUDO"
		echo -e "$output"
	done
}

function pingAllmachine {
	for i in "${hosts[@]}"
	do
	  :
		host=$i
		status=0
		newStatus=$(timeout 3 ping soc1 -n 1 | grep Received | awk {'print $7'} | awk -F "," {'print $1'})
		echo -e "\e[91m$i\e[0m - Ping Test"
		if [ "$newStatus" == "1" ]; then
			echo -e "Online"
		else
			echo -e "Offline"
		fi
	done
}

# Check to see if valid host
case "${hosts[@]}" in  *"$host"*) found="true" ;; esac

# If all hosts, then yes its valid
if [  "$host" = "all" ]; then found="true"; fi

# If not a valid host, exit
if [ "$found" = "" ]; then
	echo "Invalid Host Provided"
	exit
fi

# If not a valid command, exit
if [ "$command" == "" ] || [ "$command" == "-s" ]; then
	echo "Invalid Command Provided"
	exit
fi

# Ping Test
if [ "$command" == "test.ping" ]; then
	if [ "$host" == "all" ]; then
		pingAllmachine
		exit
	else
		pingmachine "$host"
		exit
	fi
fi

if [ "$command" == "checkUpdates" ]; then
	command="softwareUpdate -l"
	if [ "$host" == "all" ]; then
		runAllSudo "$command"
		exit
	else
		runCommandSudo $host "$command"
		exit
	fi
fi

if [ "$command" == "getUpdates" ]; then
	command = "softwareUpdate -i -a"
	if [ "$host" == "all" ]; then
		runAllSudo "$command"
		exit
	else
		runCommandSudo $host "$command"
		exit
	fi
fi

# The rest
if [ "$host" == "all" ] && [ "$sudo" == "" ]; then
	runAll "$command"
elif [ "$host" == "all" ] && [ "$sudo" == "true" ]; then
	runAllSudo "$command"
elif [ "$sudo" == "" ]; then
	runCommand $host "$command"
else
	runCommandSudo $host "$command"
fi
