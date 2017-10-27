#!/bin/bash

# This script checks to test the health status of an EC2 Amazon instance.
# The script takes one parameter which is the ID of the instance to check
# It then prints out the EC2 status information.

STATE=`aws ec2 describe-instance-status --instance-ids | grep "running" | wc -l`

# If the state of the amazon web service instance is enabled print to the user.
if [ $STATE -ge 1 ]; then

	echo "The instance is running"

# Else the amazon web service instance is not running. 
else

	echo "No such instance running"

# End if.
fi



