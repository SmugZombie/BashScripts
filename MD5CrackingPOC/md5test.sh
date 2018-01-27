#!/bin/bash
# Hashes a wordlist line by line till it finds the flag, then stops after loading to flag.txt

MD5=$2
FILE=$1

while read p; do
   p=${p::-1}
   test=$(echo -n $p | md5sum)
   test=${test::32}
   echo $test $p >> tests.txt
   if [[ "$test" == "$MD5" ]]; then
        echo "Winnar"
        echo $test $p > flag.txt
        exit
   fi
done <$FILE
