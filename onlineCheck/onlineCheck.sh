#!/bin/bash
# Online Check
# regli - github.com/smugzombie
domain=$1 # Accept a different domain / ip if user doesn't want to use Google
system=$(uname) # Check if using Linux, Cygwin, or Mac

if [ -z "$domain" ]; then domain="8.8.8.8"; fi # If no domain is passed in, use ours

function checkOnline {
	expectedResult=1 # This is the result we expect if we are online
	if [[ $system == *"Linux"* ]]; then 
		myPing-$(ping $domain -c 1 | grep -E -o '[0-9]+ received' | cut -f1 -d' ')
	elif [[ $system == *"CYGWIN"* ]]; then
		myPing=$(ping $domain -n 1 | grep -E -o 'Received = [0-9]+' | awk {'print $3'})
	elif [[ $system == *"Darwin"* ]]; then
		myPing=$(ping -c 1 $domain | grep -E -o '[0-9]+ packets received' | awk {'print $1'})
	fi
	if [ -z "$myPing" ]; then myPing=0; fi # if myPing returns empty (failed to find host) set to 0 for next comparison
	if [ $expectedResult = $myPing ]; then echo "Online"; else echo "Offline"; fi # return status to user
}

checkOnline;
