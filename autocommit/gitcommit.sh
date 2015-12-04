echo "Which project do you wish to commit?"
list=$(ls -l | grep "^d" | awk {'print $9'} | sed '/^\s*$/d')
count=0


for i in $list; do
Option[$count]=$i
echo $count - $i
count=$((count+1))
done

printf "\033[32m#? \033[m"
read selection

mySelection=${Option[$selection]}

if [ -z $mySelection ]; then
	echo "Invalid Selection"
	echo "Closing"
	exit
else
	echo "Committing "$mySelection
	cd $mySelection

	git add *

	git status | grep deleted | while read -r line ; do
    		output=$(echo $line | awk {'print $2'})
    		git rm $output
	done

	git commit -m "auto-$timestamp"
	git push -u origin master
fi
