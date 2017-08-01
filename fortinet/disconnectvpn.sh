#!/bin/bash

checkVPNStatus=$(ps aux | grep forticlient | grep -v grep)

if [ -n "$checkVPNStatus" ]; then

        processList=$(ps aux | grep forticlient | grep -v grep | awk {'print $2'})

        for process in $processList; do
                kill -9 $process
        done

fi
