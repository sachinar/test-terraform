#!/bin/bash
#This script is for checking the file present or not in  directory 
file="testfile"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
fi

#This is checking how older file is 
if [ "$(( $(date +"%s") - $(stat -c "%Y" $file) ))" -gt "60" ]; then
   echo "$file is one min older"
fi

#To check file been modified or not
oldtime=120
currenttime=$(date +%s)
filetime=$(stat $file -c %Y)
timediff=$(expr $currenttime - $filetime)
if [ $timediff -gt $oldtime ]; then
   echo "File is not modified"
  else 
  echo "File Modified"
fi
