#!/bin/bash
# Gitblocker for Production Machines
# Version 0.1
# Ron Egli - github.com/smugzombie

if [[ "$1" == "commit" ]] || [[ "$1" == "push" ]]; then
        echo "What are you doing??? This is not the DEVELOPMENT machine!"
        echo "Login to the DEV box and make your changes there knucklehead!"
        exit
fi

filename=$(basename $0)

/usr/bin/git $@

# Create an alias for git and point it to this script.
# alias git=$scriptRoot"gitBlocker.sh"
# Warning: This does not disable git if the full git path is used.
