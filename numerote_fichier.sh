#! /bin/bash

# Goes through all the files in the directory and prints them in a numbered list

value=1

for i in *; do
	echo "$value) " "$i"
	value=$(($value + 1))
done
