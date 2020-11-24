#!/bin/sh

tail -n +3 < ./profile_user.txt | awk -F: '{print "dn: uid="$1", dc=example, dc=com"} {print "cn: "$2$3} {print "sn: "$3} {print "telephoneNumber: "$4} {print "\n"}' 


