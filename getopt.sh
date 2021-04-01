#!/bin/bash

show_usage="args: [-s, -t]\
			[--sort-by=, --target=]"

TEMP=`getopt -o s:t:: --long sort-by:,target:: \
     -n 'example.bash' -- "$@"`
eval set -- "$TEMP"

sort_by=new
target=object

while true ; do
        case "$1" in
                -s|--sort-by)
                        case "$2" in
                                "") echo "Option t, no argument"; shift 2 ;;
                                *)  sort_by=$2; shift 2 ;;
                        esac ;;
                -t|--target)
                        case "$2" in
                                "") echo "Option t, no argument"; shift 2 ;;
                                *)  target=$2; shift 2 ;;
                        esac ;;
                --) shift ; break ;;
                *) echo "Internal error!" ; exit 1 ;;
        esac
done

sort_gc_detail() {
	echo $1
    echo $2
}


if [ "$sort_by" == "new" ]; then
	echo "sort-by new"
elif [ "$sort_by" == "gc" ]; then
	echo "sort-by gc"
elif [ "$sort_by" == "new-gc" ]; then
	echo "sort-by new-gc"
fi

sort_gc_detail $sort_by $target
