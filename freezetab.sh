#!/bin/bash

echo "Check before freezing (C), Freeze (F), Unfreeze (U), or Exit (X)" 
read ans1

if [[ $ans1 == [Cc] ]] ; then
	cat /tmp/frozen.fw
	freezetab.sh
elif [[ $ans1 == [Ff] ]] ; then
		iptables-save > /tmp/frozen.fw
		iptables -F
		iptables -L
		echo
		echo
		echo "*** Iptables successfully FROZEN!!! ***"
		echo
		freezetab.sh
elif [[ $ans1 == [Uu] ]] ; then
	iptables-restore < /tmp/frozen.fw
	iptables -L
	echo
	echo
	echo "*** Iptables successfully THAWED!!! ***"
	echo
	freezetab.sh
else
	exit
fi
