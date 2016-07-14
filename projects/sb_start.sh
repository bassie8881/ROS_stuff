CONFIG_FILE=/etc/sb/setup.bash

EXE_NAME=$0

DATE=`date`

log_file=/tmp/sb_start.log
rm -f $log_file

echo -e "\n$DATE: $EXE_NAME starts" >> $log_file

if [ -s $CONFIG_FILE ]; then
    echo "$DATE: $EXE_NAME using setup file $CONFIG_FILE" >> $log_file
    source $CONFIG_FILE
else
    echo "$DATE: $EXE_NAME is unable to configuration file $CONFIG_FILE, quitting ." >> $log_file
    exit 1
fi

# service network-manager start

echo "$DATE: arf_start.sh on interface $HOST_IFACE" >> $log_file

export ROS_IP=192.168.0.50

export ROS_HOSTNAME=${ROS_IP}

export ROS_MASTER_URI=http://${ROS_IP}:11311

echo "$DATE: $EXE_NAME setting ROS_IP=$ROS_IP" >> $log_file
echo "$DATE: $EXE_NAME setting ROS_HOSTNAME=$ROS_HOSTNAME" >> $log_file
echo "$DATE: $EXE_NAME setting ROS_MASTER_URI=$ROS_MASTER_URI" >> $log_file

echo "SB_HOME=$SB_HOME" >> $log_file

if [ "$ROS_IP" = "" ]; then
    echo "$DATE: $EXE_NAME can't run with empty ROS_IP." >> $log_file
    exit 1
fi


echo "Calling $SB_HOME/sb_run.sh" >> $log_file

#service network-manager start

#source $SB_HOME/sb_run.sh
setuidgid $USER_NAME screen -d -m -S sb_up $SB_HOME/sb_run.sh


#############################################################
# Run inifinte loop, make sure service does not terminate
#############################################################
c=1

while [ $c -le 5 ] ; do
sleep 1
done


