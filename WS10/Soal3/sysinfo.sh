#!/bin/sh

#Default value
separator="==============================================="
separator1="-----------------------------------------------"
default_tab="		"
is_exit="0"

while [ "$is_exit" -eq "0" ]
do
	echo $(date)
	printf '%b\n' "${separator}"
	printf '%b MAIN MENU\n' "${default_tab}"
	printf '%b\n' "${separator}"
	printf '1. Operating System Info \n2. Hardware List \n3. Free and Used Memory\n4. Hardware Detail\n5. Exit\n'
	printf 'choose 1-5:'
	read -r choose
	# Jika user ingin mengetahui OS Info
	if [ "$choose" -eq "1" ];
	then 
		printf '%b\n' "${separator1}"
		printf '%b SYSTEM STATUS\n' "${default_tab}"
		printf '%b\n' "$separator1"
		echo Username : $(whoami)
		echo OS : $(cat /etc/issue | awk '{print $1$2}')
		echo Uptime : $(uptime | awk '{print $3 $4}')
		echo IP : $(ip addr show scope global | awk '$1 ~ /^inet/ {print $2}')
		echo Hostname : $(hostname)
		read -p "Press [Enter] key to continue..." cont
	fi

	#jika user ingin mengetahui list Hardware
	if [ "$choose" -eq "2" ];
	then
		printf '%b\n' "${separator1}"
		printf '%b HARDWARE LIST\n' "${default_tab}"
		printf '%b\n' "${separator1}"
		echo Machine Hardware : $(arch)
		sudo lshw -short
		read -p "Press [Enter] key to continue..." cont
	fi

	#jika user ingin mengetahui memory yang bebas dan sedang digunakan
	if [ "$choose" -eq "3" ];
	then
		printf '%b\n' "${separator1}"
		printf '%b MEMORY\n' "${default_tab}"
		printf '%b\n' "${separator1}"

		printf '%b\n' "*******************************"
		printf '%b Memory\n' "          "
		printf '%b\n' "*******************************"
		echo Size: $(awk '/MemTotal/ { printf "%i \n", $2/1024}' /proc/meminfo)
                echo Free: $(awk '/MemFree/ { printf "%i \n", $2/1024}' /proc/meminfo)

		printf '%b\n' "*********************************************"
		printf '%b Memory Statistics\n' "            "
		printf '%b\n' "*********************************************"
		vmstat

		printf '%b\n' "*********************************************"
		printf '%b Top 10 CPU eating process\n' "          "
		printf '%b\n' "*********************************************"
		ps -eo  user,pid,%cpu,%mem,vsz,rss,tname,stat,bsdstart,bsdtime,cmd  --sort=-%cpu | head
		read -p "Press [Enter] key to continue..." cont

	fi

	#Jika pengguna ingin mengetahui detail hardware komputer
	if [ "$choose" -eq "4" ];
	then
		hardware_is_exit="0"
		while [ "$hardware_is_exit" -eq "0" ]
		do
		printf '%b\n' "${separator}"
		printf '%b HARDWARE DETAIL\n' "${default_tab}"
		printf '%b\n' "${separator}"
		printf '1. CPU\n2. Block Devices\n3. Back\n'
		printf 'Choose 1-3:'
		read -r hardware_choose
		if [ "$hardware_choose" -eq "1" ];
		then
			printf '%b\n' "${separator1}"
			printf '%b CPU\n' "${default_tab}"
			printf '%b\n' "${separator1}"
			echo Model Name: $(cat /proc/cpuinfo | grep 'model name' | uniq)
			echo Frequency: $(lscpu | grep MHz | awk '{print $3}' )
			echo cache: $(lscpu | grep 'L3 cache' | awk '{print $3}')
			read -p "Press [Enter] key to continue..." cont
		fi

		if [ "$hardware_choose" -eq "2" ];
		then 
			printf '%b\n' "${separator1}"
			printf '%b Block Devices\n' "${default_tab}"
			printf '%b\n' "${separator1}"
			lsblk
			read -p "Press [Enter] key to continue..." cont
		fi
		if [ "$hardware_choose" -eq "3" ];
		then
			echo back to main menu...
			hardware_is_exit="1"
		fi
		done
	fi

	#jika pengguna ingin keluar dari program
	if [ "$choose" -eq "5" ];
	then
		echo Bye Bye...
		read -p "Press [Enter] key to continue..." cont
		is_exit="1"
	fi

done
