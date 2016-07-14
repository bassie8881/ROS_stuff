#!/bin/bash
file_name="$1"
rosbag record -O $file_name /scan_lsl /scan_lsm /tf /myahrs_imu /camera/image_raw
