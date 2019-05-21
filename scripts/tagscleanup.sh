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

cp "${1}" old_"${1}" # make backup

while read -r tag; do
   echo ${tag,,} # lowercase 
   # TODO: how do I chain these substitutions
  # echo ${STDIN/gilette/gillette} | \ # fix misspelling
  # echo ${STDIN/gillettecommercial/gilletead}
done < "$1" > clean_"${1}" # output to new file

#echo ${1,,}
#sed 's/gilette/gillette/g' >
