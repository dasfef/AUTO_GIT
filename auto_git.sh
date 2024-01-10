#!/bin/bash
location=$HOME/Desktop/PJ_auto_git
log_file=$HOME/Desktop/PJ_auto_git/date_log.txt
START_DATE="2024-01-11"

echo "[ Auto git push START! ]"
echo ""

# APPEND GIT CONTENT
echo "摩斧作針"
echo "PRESENTED BY _CYW_"
echo $(date "+%Y-%m-%d-%H:%M:%S")

if [ ! -z "$last_log" ]; then
	CURRENT_DATE=$(date +%Y-%m-%d)
	DAY_DIFF=$(ddiff $START_DATE $CURRENT_DATE -f '%d')
	DAY_COUNT=$((DAY_DIFF + 1))
	CURRENT_DATETIME=$(date +%Y-%m-%d-%H:%M:%S)
	LOG_MESSAGE="DAY$(printf '%03d' $DAY_COUNT)"
else
	DAY_COUNT="DAY001"
fi

echo $CURRENT_DATETIME" git pushed :" $LOG_MESSAGE >> $log_file
