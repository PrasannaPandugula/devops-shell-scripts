#!/bin/bash

# variables

LOG_DIR="/e/devops-shell-scripts/logs"
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)
LOG_FILE="$LOG_DIR/app-$YESTERDAY.log"

#check log file exists

if [ -f "$LOG_FILE" ]; then
    echo "Found log file: $LOG_FILE"

    #Search for errors 
    ERRORS=$(grep -c "ERROR" "$LOG_FILE")

    if [ $ERRORS -gt 0 ]; then
	    echo "Found $ERRORS errors in $LOG_FILE"
    else
	    echo "No errors found in $LOG_FILE"
    fi
else 
    echo "Log file for $YESTERDAY not found!"

fi
    
