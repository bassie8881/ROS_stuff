cmake_minimum_required(VERSION 2.4.6)
include($ENV{ROS_ROOT}/core/rosbuild/rosbuild.cmake)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)

rosbuild_init()

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

#a lib of pre-existing driver files
rosbuild_add_library(driver_existing src/SerialCom.cpp src/wheelchair.cpp src/WheelEncoder.cpp)

rosbuild_add_executable(wc_ros src/main.cpp)
rosbuild_add_executable(wc_js_tele src/teleop.cpp)
rosbuild_add_executable(wc_test src/test_drive.cpp)
target_link_libraries(wc_ros driver_existing)
rosbuild_link_boost(wc_ros thread)

#rfu stuff
rosbuild_add_library(rf_unit src/RF/RFUnit.cpp src/RF/rfu_ser.cpp)
rosbuild_add_executable(rfu_ros src/RF/rfu_ros.cpp)
target_link_libraries(rfu_ros rf_unit)

#uncomment if you have defined messages
#rosbuild_genmsg()
#uncomment if you have defined services
#rosbuild_gensrv()
