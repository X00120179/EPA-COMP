#!/bin/bash

cnt=`grep processor /proc/cpuinfo | wc -l`

# If number of CPUs is less than number entered by user then not enough
if [ $cnt -le $1 ]; then

  # Tell the user they do not have sufficient CPUs to run the program
  echo "Not enough CPUS, you need at least" $1 " exiting"

# Else the user has enough
else

  # Tell the user they have enough CPUs to run the program
  echo "Enough CPUs exiting, running program"

# End if
fi


