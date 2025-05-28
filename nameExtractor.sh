#! /bin/bash

# The goal here is to get either the name of a file without its path or its path without its name
# It was a way to practice pattern removal in bash

nameextractor()
{
    local opt_name=0
    local opt

    OPTIND=0
    while getopts ":np-:" opt; do
        case $opt in
            n ) opt_name=1 ;;
            p ) ;;
            - ) case $OPTARG in
                    help ) echo "Name extractor :"
                           echo "-n --name: print the name of the file without its path"
                           echo "-p --path: print the path of the file without its name"
                           return 0 ;;
                    path ) ;;
                    name ) opt_name=1 ;;
                    * ) echo "ERROR: invalid option: --$OPTARG"
                        return 1 ;;
                esac ;;
            ? ) echo "ERROR: invalid option: -$OPTARG"
                return 1 ;;
        esac
    done

    shift $((OPTIND - 1))

    while [ -n "$1" ]; do
        if [ $opt_name -ne 0 ]; then
            echo "${1##*/}"
        else
            echo "${1%/*}"
        fi
        shift
    done

}
