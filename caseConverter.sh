#! bin/bash

# Convert either the file name, or its content to upppercase or lowercase

caseConverter()
{
	local opt_upper=0
	local opt_lower=0
	local opt_name=0
	local opt

	OPTIND=0
	while getopts ":uln-:" opt ; do
		case $opt in
			u ) opt_upper=1 opt_lower=0 ;;
			l ) opt_lower=1 opt_upper=0 ;;
			n ) opt_name=1;;
			- ) case $OPTARG in
				upper ) opt_upper=1 ;;
				lower ) opt_lower=1 ;;
				name ) opt_name=1 ;;
				help ) 
					echo "Text converter: "
					echo "-u --upper: convert to uppercase"
					echo "-l --lower: convert to lowercase"
					echo "-n --name: convert the name of the file and not the content"
					echo "By default upper option is selected"
					return 0 ;;
				* ) echo "option invalide --$OPTARG"
					return 1 ;;
				esac ;;
			? ) echo "option invalide --$OPTARG"
				return 1 ;;
		esac
	done
	shift $((OPTIND - 1))
	

	while [ -n "$1" ] ; do
		if [ $opt_name -ne 0 ] ; then
			if [ $opt_lower -ne 0 ] && [ $opt_upper -eq 0 ]; then

				tmp=$( (ls "${1#*/}") | tr [:upper:] [:lower:] )
				tmp=${tmp%.*}

				if [ "$1" != "$tmp.${1#*.}" ]; then
					mv "$1" "$tmp.${1#*.}"
				fi

			else

				tmp=$( (ls "${1#*/}") | tr [:lower:] [:upper:] )
				tmp=${tmp%.*}

				if [ "$1" != "$tmp.${1#*.}" ]; then
					mv "$1" "$tmp.${1#*.}"
				fi
			fi

		else
			if [ $opt_lower -ne 0 ] && [ $opt_upper -eq 0 ]; then

				tr [:upper:] [:lower:] < "$1" > tmp
				mv tmp "$1"
			else

				tr [:lower:] [:upper:] < "$1" > tmp
				mv tmp "$1"
			fi
		fi

		echo "${1##*/} conversion done"
		shift
	done
}
