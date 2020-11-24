#!/bin/sh

term_test(){
	echo execute TERM
}

usr2_test(){
	echo execute USR2
}

trap "term_test" TERM 
trap "usr2_test" USR2

while [ 1 -gt 0 ]
do 
	echo Running...
	sleep 2
done
