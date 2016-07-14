export USER_HOME=/home/odroid

source ${USER_HOME}/ros/Indigo/devel/setup.bash

export SB_HOME=${USER_HOME}/ros/Indigo/src/uts_sensor_box/data_recorder
export STOP_SB_FILE=/var/sb/stop.txt
export SB_LOG_FILE=${USER_HOME}/log/sb.log
export HOST_NAME=odrobox
export LAUNCH_PID_FILE=/var/sb/sb_launch_pid
export USER_NAME=odroid
export USER_PASSWORD=odroid
export HOST_IFACE=eth0
