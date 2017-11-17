#!/bin/bash

# 1. Invoke load test
for i in {0 .. $2}
do
	echo " "
	echo "******** Invoking the loadtest ********"
	./loadtest $i &

	# 2. Sleep for the duration of the loadtest T
	echo " "
	echo "******** Sleeping for the duration of the loadtest ********"
	sleep $2

	# 3. Pkill the loadtest
	echo " "
	echo "******** Killing the loadtest ********"
	pkill loadtest
done
