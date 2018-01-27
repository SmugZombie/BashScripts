#!/bin/bash 
# Splits a word file into 15 pieces to speed up hash cracking
MD5=647c4d66890ce8005efd47794c0b29c8
range=(a b c d e f g h i j k l m n o)
fspec=ctfwordlist.txt
split --number=l/15 ${fspec} ctf-wordlist.

for i in "${range[@]}"
do
        md5test.sh ctf-wordlist.a$i $MD5 &
done
