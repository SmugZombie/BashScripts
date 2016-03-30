#!/bin/bash


function startVPN {
	echo "Wee"
}

function stopVPN {
	killall forticlientsslvpn_cli
}

function getStatus {
	processes=$(ps aux | grep forticlientsslvpn_cli | grep -v grep)

	if [ -z "$processes" ]; then
		echo "Forticlient is NOT Running"
	else
		currentIp=$(ifconfig | grep 10.0.0 | awk -F ":" {'print $2'} | awk {'print $1'})
		echo "Forticlient is Running"
		echo "Current VPN IP: $currentIp"
	fi
}

input=$1

if [ "$input" == "" ]; then
	while [ "$input" == "" ]; do
	echo  "Which task do you wish to perform? (start|stop|restart|status)"
	echo -n ">> "
	read input
	done
fi


case "$input" in
	start)
		echo "Hello"
	;;
	stop)
		killall forticlientsslvpn_cli
	;;
	restart)
		stopVpn
		sleep 2
		startVPN
	;;
	status)
		getStatus
	;;
	*))
		echo "Usage: (start|stop|restart|status)"
	;;
esac
root@SmugDesk-Nix:/opt/tvscripts/bin# mv killvpn.sh forticlient.sh
root@SmugDesk-Nix:/opt/tvscripts/bin# cat forticlient.sh 
#!/bin/bash


function startVPN {
	echo "Wee"
}

function stopVPN {
	killall forticlientsslvpn_cli
}

function getStatus {
	processes=$(ps aux | grep forticlientsslvpn_cli | grep -v grep)

	if [ -z "$processes" ]; then
		echo "Forticlient is NOT Running"
	else
		currentIp=$(ifconfig | grep 10.0.0 | awk -F ":" {'print $2'} | awk {'print $1'})
		echo "Forticlient is Running"
		echo "Current VPN IP: $currentIp"
	fi
}

input=$1

if [ "$input" == "" ]; then
	while [ "$input" == "" ]; do
	echo  "Which task do you wish to perform? (start|stop|restart|status)"
	echo -n ">> "
	read input
	done
fi


case "$input" in
	start)
		echo "Hello"
	;;
	stop)
		killall forticlientsslvpn_cli
	;;
	restart)
		stopVpn
		sleep 2
		startVPN
	;;
	status)
		getStatus
	;;
	*))
		echo "Usage: (start|stop|restart|status)"
	;;
esac
