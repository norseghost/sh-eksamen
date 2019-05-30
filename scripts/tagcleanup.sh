#!/bin/bash

# tagscleanup.sh
# takes a text file and
# - makes everything lowercase
# - normalizes certain common misspellings/synonyms

# make sure file exits for reading
if [ ! -f ${1} ]; then
  echo "File ${1} does not exist"
  exit 1
fi

while read -r tag; do
  echo ${tag,,} # lowercase 
done < "$1" > clean_"${1}" # output to new file


