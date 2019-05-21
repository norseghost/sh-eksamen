#!/bin/bash

keep_ts=$(date --date="2019-01-13" +%s)
echo $keep_ts
mkdir old_${1}
for file in ${1}*; do
    file_date=$(echo $file | cut -d '_' -f1 |cut -d '/' -f2 )
    file_ts=$(date --date=$file_date +%s)
   # echo $file_date
    #echo $file_ts
    if [ "$file_ts" -lt "$keep_ts" ]; then
        mv "$file" old_${1}
    fi
done
