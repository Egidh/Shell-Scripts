    #!/bin/bash
    
    # Challenge from some online platform
    # Compares three arrays and print out the numbers common to all of them

    a=(3 5 8 10 6)
    b=(6 5 4 12)
    c=(14 7 5 7)
    
    declare -i count
    
    for i in "${a[@]}" ; do count[$i]+=1 ; done
    for i in "${b[@]}" ; do count[$i]+=1 ; done
    for i in "${c[@]}" ; do count[$i]+=1 ; done
    
    for i in "${!count[@]}" ; do
    	if [ "${count[$i]}" == 3 ] ; then echo "$i" ; fi
    done
