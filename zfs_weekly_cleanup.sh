#!/bin/bash

current=`date "+%Y%m%d"`

#delpoint=tank/backup@weekly`date -d "friday - 4 week" +%Y%m%d`--find out the date of 4 weeks ago

wks=4

echo -------starting at `date +%F:%T`----------

delpoint=`date -d "friday -$wks week" +%Y%m%d`

echo currentdelpoint is $delpoint

# take snapshot every friday 

echo creat a snapshot of tank/backup@weekly$current

current_snapshot=`/sbin/zfs snap -r tank/backup@weekly$current`

## iterates all weekly snapshot inventory to find the snapshot dated on  friday of 4 weeks ago to delete(destroy)"



for s in `/sbin/zfs list -t snapshot |grep weekly| cut -d' ' -f1`
do
        if [[ $s == *$delpoint ]];
        then
                echo "Delete snapshot $s at $delpoint "
                /sbin/zfs destroy $s

        fi
echo -e "current weekly snapshots are: $s"
done
echo -e --------finish at `date +%F%T`--------"\n"
