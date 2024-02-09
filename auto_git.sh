#!/bin/zsh
location=$HOME/Desktop/PJ_auto_git
log_file=$HOME/Desktop/PJ_auto_git/date_log.txt
PUSH_FILE=$HOME/Desktop/PJ_auto_git/push.txt
NUM=001
START_DATE="2024-01-11"

echo "[ Auto git push START! ]"
echo ""

# APPEND GIT CONTENT
echo "摩斧作針"
echo "PRESENTED BY _CYW_"
echo $(date "+%Y-%m-%d-%H:%M:%S")

if [ ! -z "$log_file" ]; then
	CURRENT_DATE=$(date +%Y-%m-%d)
	DAY_DIFF=$(ddiff $START_DATE $CURRENT_DATE -f '%d')
	DAY_COUNT=$((DAY_DIFF + 1))
	CURRENT_DATETIME=$(date +%Y-%m-%d-%H:%M:%S)
	LOG_MESSAGE="DAY$(printf '%03d' $DAY_COUNT)"
else
	DAY_COUNT="DAY001"
fi

if [ ! -z "$PUSH_FILE" ]; then
	LAST_NUM=$(tail -n1 $PUSH_FILE | grep -o -E '[0-9]+')
	echo "LAST_NUM before: $LAST_NUM"
	LAST_NUM=$(echo $LAST_NUM | sed 's/^0*//')
	echo "LAST_NUM after: $LAST_NUM"
	NEW_NUM=$((10#$LAST_NUM + 1))
	CURRENT_NUM="INDEX : $(printf '%03d' $NEW_NUM)"
	echo "AUTO GIT PUSHED COUNT | "$CURRENT_NUM >> $PUSH_FILE
else
	echo "AUTO GIT PUSHED COUNT | INDEX : "$NUM >> $PUSH_FILE
fi

echo $CURRENT_DATETIME" git pushed :" $LOG_MESSAGE >> $log_file

cd /users/dasfef/desktop/PJ_auto_git
git add .

git commit -m "AUTO GIT PUSHED | INDEX : $(tail -n1 $PUSH_FILE) | DATE : $CURRENT_DATETIME, $(tail -n1 $log_file | grep -o -E '\bD\w*' | tail -n1)"

git push -u origin main
