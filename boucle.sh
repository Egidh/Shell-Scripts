#! /bin/bash

# print all the given arguments 5 times

count=0
while [ $count -lt 5 ]; do
	echo "$@"
	count=$((count + 1))
	sleep 1
done
