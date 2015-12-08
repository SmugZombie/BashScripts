#!/bin/bash
# Inode Counter
# github.com/smugzombie

function countInodes {
  total=0;
  for i in `ls -lah|awk '/^d/' |awk '{for (i=9; i<=NF;i++) print $i}'|awk '!/^\.$|^\.\.$/'`;
    do files=$(find $i |wc -l);total=$(($total + $files));echo -e "$files\t\t$i" >> inodes.txt;
  done;
  echo -e "Total inodes:\t$total" >> inodes.txt; 
  cat inodes.txt|sort -n > inodes_sorted.txt;
  rm -rf inodes.txt;
  sleep 2
  cat inodes_sorted.txt;
  rm -rf inodes_sorted.txt
}

countInodes;


# Oneliner
# total=0; for i in `ls -lah|awk '/^d/' |awk '{for (i=9; i<=NF;i++) print $i}'|awk '!/^\.$|^\.\.$/'`; do files=$(find $i |wc -l);total=$(($total + $files));echo -e "$files\t\t$i" >> inodes.txt; done; echo -e "Total inodes:\t$total" >> inodes.txt; cat inodes.txt|sort -n > inodes_sorted.txt; rm -rf inodes.txt; cat inodes_sorted.txt; rm -rf inodes_sorted.txt
