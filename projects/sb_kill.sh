#!/bin/bash
#
#
# Set environment
#
CONFIG_FILE=/etc/sb/setup.bash

EXE_NAME=$0

source $CONFIG_FILE
rm -f $STOP_SB_FILE      #start from a fresh state
DATE=`date`

#
# Stop SB
#


#
# Kill current arf_launch, communicates to hoist service that wether shut-down is required by creating $STOP_ARF_FILE
#


echo "Shut-down sb ... " >> $SB_LOG_FILE
touch $STOP_SB_FILE

kill -TERM $(cat $LAUNCH_PID_FILE)
sleep 8

echo "Killed sb_run.sh" >> $SB_LOG_FILE

