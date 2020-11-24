#!/bin/sh

echo $$ > pid.file

ready=0
read_files(){
        read -r file < killdashnine.txt
        echo $file
}

vocalist2_ready(){
	ready=1
	printf '$s\n' "$(ready)"
}

trap "read_files" USR2
trap "vocalist2_ready" TERM

while [ 1 -gt 0 ]
do
        echo Waiting for vocalist 2
        sleep 2
done




