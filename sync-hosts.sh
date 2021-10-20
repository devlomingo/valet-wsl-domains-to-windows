#!/bin/bash

valet links > valetLinks
while read -r line; do
  # Reading each line
  project=$(echo $line | awk -F "|" '{print $2}');
  if [ $project ] && [ $project != 'Site' ]; then
    domain=`echo $project`
    newLine="\n 127.0.0.1 www.${domain}.test ${domain}.test"
    #Add to windows hosts file
    echo $newLine >> /mnt/c/Windows/System32/drivers/etc/hosts
  fi
done < valetLinks