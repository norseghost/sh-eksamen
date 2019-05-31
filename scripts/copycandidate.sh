#!/bin/bash


# make sure file exits for reading
if [ ! -f ${1} ]; then
  echo "File ${1} does not exist"
  exit 1
fi

mkdir ${1}_posts

while read -r post; do
    cp ${post}* ${1}_posts
done < "$1"
