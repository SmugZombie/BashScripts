#!/bin/bash
# Online Check
# regli - github.com/smugzombie

system=$(uname) # Check if using Linux, Cygwin, or Mac

function checkOnline {
expectedResult=1
if [[ $system == *"Linux"* ]]; then
  myPing-$(ping 8.8.8.8 -c 1 | grep -E -o '[0-9]+ received' | cut -f1 -d' ')
elif [[ $system == *"CYGWIN"* ]]; then
  myPing=$(ping 8.8.8.8 -n 1 | grep -E -o 'Received = [0-9]+' | awk {'print $3'})
elif [[ $system == *"Darwin"* ]]; then
  myPing=$(ping -c 1 8.8.8.8 | grep -E -o '[0-9]+ packets received' | awk {'print $1'})
fi

if [ $expectedResult = $myPing ]; then
        echo "Online"
else
        echo "Offline"
fi

}

checkOnline;
