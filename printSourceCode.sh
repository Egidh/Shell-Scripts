#! /bin/bash

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
