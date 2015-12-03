#!/bin/bash
externalIP=$(curl -s http://digdns.com/ip/?mode=quick)
IPprovider=$(curl -s http://digdns.com/ip/whois.php?ip=$externalIP)
provider=$(echo $IPprovider | awk -F "\"" {'print $8'})
echo External IP: $externalIP;
echo Provider: $provider;
