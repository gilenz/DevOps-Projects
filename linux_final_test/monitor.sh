#!/bin/bash

  cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
  memUsage=$(free -m | awk '/Mem/{print $3}')
  DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
  alertusage=80 ###if some of the thresholds is above 80 % the system will alert##
  totalmemory=$(free -m | awk '/Mem/{print $2}')
  memoryusagedecimal=$(awk "BEGIN {print $memUsage / $totalmemory}")
  memoryusage=$(echo "$memoryusagedecimal * 100" | bc)


comparison=$(echo "$cpuUsage > $alertusage" | bc) ##checks if cpuusage is above 80% if so comparison=1
   
if [ "$comparison" -eq 1 ]; then  ## if cpuusage is above 80% the system will send to the user terminal the following sentence
	    echo " cpuusage is over 80% "
    fi
comparison=$(echo "$memoryusage > $alertusage" | bc) ## checks if the memoryusage is above 80% if so comparison=1


  if [ "$comparison" -eq 1 ]; then ##if memoryusage is above 80% then the script will sent to the terminal the following output
	  echo "the memory usage is above 80%" 
  fi

comparison=$(echo "$DISK_USAGE > $alertusage" | bc) ## checks if the diskusage is above 80% if so comparison=1

  if [ $comparison -eq 1 ]; then ##if diskusage is above 80% then the script will sent to the terminal the following output
	  echo "the disk usage is above 80%"
  fi
