Get Used Ram
free -m | head -n 2 | tail -n 1 | awk {'print $3'}

Get Total Ram
free -m | head -n 2 | tail -n 1 | awk {'print $2'}

Get CPU
top | head -n 1 | awk -F "average: " {'print $2'}

Get 1 min load avg
top | head -n 1 | awk -F "average: " {'print $2'} | awk -F ", " {'print $1'}

Get 5 min load avg
top | head -n 1 | awk -F "average: " {'print $2'} | awk -F ", " {'print $2'}

Get 15 min load avg
top | head -n 1 | awk -F "average: " {'print $2'} | awk -F ", " {'print $3'}

Get Time
date +%Y-%m-%d" "%H:%M:%S

Get Inode Usage
df -i | head -n 2 | tail -n 1 | awk {'print $5'}

Get Root Disk
df -h | head -n 2 | tail -n 1

Get Root Disk Free
echo "$diskStat" | awk {'print $4'}

Get Root Disk Total
echo "$diskStat" | awk {'print $2'}
