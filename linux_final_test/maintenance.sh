#!/bin/bash
TEMP1="/tmp"
TEMP2="/var/tmp"
OLD_LOGS="/var/log"

############# clean temp files#########
echo "removing tmp files"
rm -rf $TEMP1/*
if [ $? -eq 0 ]; then
echo " temp files from $TEMP1 removed successfully "
else
	echo " couldnt remove temp files from $TEMP1 "
	exit 1
fi


rm -rf $TEMP2/*
if [ $? -eq 0 ]; then
echo " temp files from $TEMP2 removed successfully "
else 
	echo " couldnt remove temp files from $TEMP2 "
	exit 1
fi

##### clean log files ###
echo "removing log files older than 90 days"
find $OLD_LOGS -type f -mtime 90 -exec rm {} \;
if [ $? -eq 0 ]; then
	echo " old logs removed successfuly "
	exit 0
else
	echo " couldnt remove old logs "
fi
 




