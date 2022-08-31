#!/usr/bin/env bash

DO_LOOP="yes"
LOOPS=0
set +e

if [ "$DO_LOOP" == "yes" ]; then
	while true; do
		if [ ${LOOPS} -gt 0 ]; then
			echo "Restarted $LOOPS times"
		fi
		"./bedrock_server" $@
		echo "To escape the loop, press CTRL+C now. Otherwise, wait 3 seconds for the server to restart."
		echo ""
		sleep 3
		((LOOPS++))
	done
else
	exec "./bedrock_server" $@
fi