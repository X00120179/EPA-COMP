#!/bin/bash

# 1. Invoke load test
echo " "
echo "******** Invoking the loadtest ********"
./loadtest $1 &

# 2. Sleep for the duration of the loadtest T
echo " "
echo "******** Sleeping for the duration of the loadtest ********"
sleep $2

# 3. Pkill the loadtest
echo " "
echo "******** Killing the loadtest ********"
pkill loadtest
