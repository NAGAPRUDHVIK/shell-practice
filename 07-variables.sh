#!/bin/bash

# DATE=$(date)

# echo "The Current date and time is:${DATE}"

#Example 2

START_TIME=$(date +%s)
sleep 10
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "The current script executed in total seconds of ${TOTAL_TIME}"

