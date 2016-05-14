#!/bin/bash
# 10.6 or higher
# github.com/smugzombie

ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%", $10/$5 * 100)}'
