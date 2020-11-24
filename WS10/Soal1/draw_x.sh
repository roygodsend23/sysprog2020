#!/bin/bash


#p = banyaknya baris yang akan menjadi output
p=9;

#Program ini untuk mencetak output baris ke 1 hingga ke 4
for (( i=1 ; i<=p/2 ; i++))
do
	for ((j=1; j<i ; j++))
	do
		echo -n " "
	done
	echo -ne "\u2588"
	for((j=1; j<= p-(i*2); j++))
	do
		echo -n " "
	done
	echo -ne "\u2588"
	for((j=1; j<i; j++))
	do
		echo -n " "
	done
	echo
done


#Program ini untuk mencetak output baris ke 5
for((j=1;j<=p/2;j++))
do
	echo -n " "
done
echo -ne "\u2588"
echo ""


#Program ini untuk mencetak output baris ke 6 hingga ke 9

for(( i=p/2; i>=1; i--))
do
	for((j=i;j>1;j--))
	do
		echo -n " "
	done
	echo -ne "\u2588"
	for((j=p-(i*2);j>=1;j--))
	do
		echo -n " "
	done
	echo -ne "\u2588"
	for((j=i; j>1;j--))
	do
		echo -n " "
	done
	echo 
done

