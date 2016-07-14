execute_process(COMMAND "/home/odroid/git_laser_scanner/build/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_xbee/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/odroid/git_laser_scanner/build/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_xbee/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
