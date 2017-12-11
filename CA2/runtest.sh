#!/bin/bash
# Format for neat display
echo -e "C0 \t N \t idle" > results.dat

# Loop
for i in {1..50}
do
	# Run loadtest.C
	echo "Running the loadtest $i..."
	./loadtest $i&

	# Sleep loadtest for 5
	echo "Loadtest $i is sleeping..."
	sleep 5

	# Number of completions in synthetic.dat
	C=`cat synthetic.dat | wc -l`

	# Collect CPU utilization
        idle=`mpstat 5 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`
	echo "$idle"

	# Kill the loadtest
	echo "Loadtest $i has been terminated..."
	pkill loadtest

	echo -e "$C \t $i \t $idle" >> results.dat

	# Remove synthetic.dat file every loop as it regenerates.
	rm synthetic.dat
done 
