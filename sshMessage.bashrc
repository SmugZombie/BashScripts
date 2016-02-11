# Display message to SSH Users
if [ "$SSH_TTY" ]; then
        current_ip=$(ifconfig | grep 10. | awk -F ":" {'print $2'} | grep 10. | awk {'print $1'} | head -n 1)
        external_ip=$(timeout 3 curl -s http://digdns.com/ip/)

        echo "#########################################";
        echo "#  Welcome to My Box                    #";
        echo "#  My Internal IP is: $current_ip       #";
        echo "#  My External IP is: $external_ip      #";
        echo "#########################################";
fi
