#!/bin/bash

apps=(
'python-dev'
'python-pip'
'python-numpy'
'python-scipy'
'python-matplotlib'
'ipython'
'ipython-notebook'
'python-pandas'
'python-sympy'
'python-nose'
'python-picamera'
'openssh-client'
'openssh-server'
'vim'
)

sudo apt-get update

# Loop over apps and install each one with default 'yes' flag
for app in "${apps[@]}"
do
    sudo apt-get install $app -y
done 
