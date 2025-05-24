#! /bin/bash

value=1

for i in *; do
	echo "$value) " "$i"
	value=$(($value + 1))
done
