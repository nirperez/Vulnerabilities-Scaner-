#!/bin/bash
#Getting the user input

echo "The script will map network devices for ports, services, and vulnerabilities. "
echo "Enter target IP:"
read IP
echo "[1] Open ports"
echo "[2] Open ports and services"
echo "[3] Vulnerabilities"
echo "[4] All options"
read option
open-ports() {
        nmap -p- $IP
}

#The script maps for open ports and services

open-ports-sV() {

        sudo nmap -p- -sV -sC $IP
}


#The script look for vulnerabilities

vulnerabilities() {

        nmap -sV $IP -oX results.xml
        searchsploit --nmap results.xml
}

if [ $option == 1 ]
        then
        open-ports
fi

if [ $option == 2 ]
        then
        open-ports-sV
fi

if [ $option == 3 ]
        then
        vulnerabilities
fi

if [ $option == 4 ]
        then
        open-ports-sV
        vulnerabilities
fi

#Code from the site bughacking.com
#https://bughacking.com/how-to-use-searchsploit-in-kali-linux/
