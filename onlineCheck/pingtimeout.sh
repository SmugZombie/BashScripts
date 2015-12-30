myPing=$(timeout 1.0 ping $1 -c 1 | grep -E -o '[0-9]+ received' | cut -f1 -d' ')
if [ -z $myPing  ]; then myPing=0; fi
