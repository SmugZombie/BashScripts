#!/bin/bash

# autocommit.sh
# Written by Ron Egli
# github.com/smugzombie

#Variables
timestamp=$(date +%s)

cd /your/script/location
git add *

git status | grep deleted | while read -r line ; do
    output=$(echo $line | awk {'print $2'})
    git rm $output
done

git commit -m "auto-$timestamp"
git push -u origin master

