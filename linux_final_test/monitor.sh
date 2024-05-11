#!/bin/bash

  cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
  memUsage=$(free -m | awk '/Mem/{print $3}')
  DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
  alertusage=80 ###if some of the thresholds is above 80 % the system will alert##
  totalmemory=$(free -m | awk '/Mem/{print $2}')
  memoryusage=$((memUsage / totalmemory))

comparison=$(echo "$cpuUsage > $alertusage" | bc)
   
if [ "$comparison" -eq 1 ]; then
	    echo " cpuusage is over 80% "
    fi
comparison=$(echo "$memoryusage > $alertusage" | bc)


  if [ "$comparison" -eq 1 ]; then
	  echo "the memory usage is above 80%"
  fi

comparison=$(echo "$DISK_USAGE > $alertusage" | bc)

  if [ $comparison -eq 1 ]; then
	  echo "the disk usage is above 80%"
  fi
