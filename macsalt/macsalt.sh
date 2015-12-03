#!/bin/bash
# MacSalt
# smugzombie
# Version 1.1

user=myusername
host=$1
command=$2
hosts=( "mac1" "mac2" "mac3" )

function runCommand {
        host=$1
        command=$2
        output=$(ssh $user@$host $command)
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

function runAll {
        for i in "${hosts[@]}"
        do
          :
          host=$i
                command=$1
                output=$(ssh $user@$host $command)
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

case "${hosts[@]}" in  *"$host"*) found="true" ;; esac

if [  "$host" = "all" ]; then
        found="true"
fi

if [ "$found" = "" ]; then
        echo "Invalid Host Provided"
        exit
fi

if [[ "$@" == *"-s"* ]];then
  sudo="true"
fi

if [ "$command" == "" ] || [ "$command" == "-s" ]; then
        echo "Invalid Command Provided"
        exit
fi

if [ "$host" == "all" ] && [ "$sudo" == "" ]; then
        runAll "$command"
elif [ "$host" == "all" ] && [ "$sudo" == "true" ]; then
        runAllSudo "$command"
elif [ "$sudo" == "" ]; then
        runCommand $host "$command"
else
        runCommandSudo $host "$command"
fi
