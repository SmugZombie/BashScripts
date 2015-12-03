#!/bin/bash
oldVolume=$(osascript -e 'set ovol to output volume of (get volume settings)')
action=$(osascript -e 'set volume 7')
newVolume=$(osascript -e 'set ovol to output volume of (get volume settings)')
echo -e "Current Volume: $oldVolume"
echo -e "New Volume    : $newVolume"
