#!/bin/bash
if [ $# -lt 3 ] ; then
        echo ""
        echo "usage: echo $(basename $0) <mis-matches> <filter-value> <filename>"
        echo "filters the table (width should be exactly 7) "
        echo "expects: kmer, mis-match, value at 3, 5, 7, 9 and 11 in that order"
        echo "this script uses OR condition"
        echo ""
        exit 0
fi

mis=$1
val=$2
file=$3

if [ "$mis" -eq "0" ]; then
head -n 1 ${file};
fi
awk -v mm="$mis" -v x="$val" -F "\t" '{ if( ( $2 == mm ) && ( $3 >= x || $4 >= x || $5 >= x || $6 >= x || $7 >= x ) ) { print } }' $file
