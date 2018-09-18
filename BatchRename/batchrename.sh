#!/bin/bash
# Ron Egli - gh/Smugzombie

# Loop through files in current directory based on match

regex=breachbox*.ovpn
find=breachbox
replace=BreachCollector

for i in $regex ; do
    orig_file=$i
    new_file=${orig_file/$find/$replace}
    mv $orig_file ./$new_file
done
