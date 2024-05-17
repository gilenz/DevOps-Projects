#!/bin/bash
EDUCATION_DIR="$HOME/education"
DEVELOPMENT_DIR="$HOME/development"
DST_DIR="$HOME/backup"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$DST_DIR/bakcup_$TIMESTAMP"
mkdir -p "$BACKUP_DIR"
if [ ! -d "$EDUCATION_DIR" ]; then ## checks if education directory exist ##
	echo "education dir not exists"
	exit 1
fi
if [ ! -d "$DEVELOPMENT_DIR" ]; then ### checks if development directory exist ##
	echo " development dir not exist "
	exit 1
fi
tar czf $BACKUP_DIR/education.tar.gz $EDUCATION_DIR <2 /dev/null  ## archieving the education folder and save the backup in /home/usr/backup/backup date ##
if [ $? -eq 0 ]; then
	echo " archiev for education folder completed successfuly "
else 
        echo " couldnt archiev folder education "
exit 1

fi	
tar czf $BACKUP_DIR/development.tar.gz $DEVELOPMENT_DIR <2 /dev/null ## archieving the development folder and save the backup in /home/usr/backup/backup date ###
if [ $? -eq 0 ]; then
	echo " archiev for development folder completed successfully "
else 
	echo " couldnt archiev folder development "
exit 1
fi
echo "Backup completed on $(date)" >> "$DST_DIR/backup.log"  ### if backup completed save it into a log file win the date the log file in: /home/usr/backup/backup.log ##
