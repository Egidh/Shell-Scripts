#! /bin/bash

# the goal here was to create a script printing it's own source code
# this was a fun way to make one think !

psourcecode()
{
	echo -n "$@"
	echo -ne "\047"
	echo -n "$@"
	echo -e "\047"
}
psourcecode '#! /bin/bash
psourcecode() 
{
	echo -n "$@"
	echo -ne "\047"
	echo -n "$@"
	echo -e "\047"
}
psourcecode '
