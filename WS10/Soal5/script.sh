#!/bin/sh

pid=$(ps -ef | grep trap | grep -v grep | awk '{print $2}' )
kill -TERM  $pid & kill -USR2 $pid
sleep 2
kill -TERM $pid & kill -TERM $pid

