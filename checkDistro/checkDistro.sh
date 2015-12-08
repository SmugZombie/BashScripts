#!/bin/bash
# Distro / OS Check
# regli - github.com/smugzombie

if [[ $system == *"Linux"* ]]; then
  echo "Linux";
elif [[ $system == *"CYGWIN"* ]]; then
  echo "Cygwin";
elif [[ $system == *"Darwin"* ]]; then
  echo "OSX";
fi
