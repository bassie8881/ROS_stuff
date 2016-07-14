# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "arf_msgs: 6 messages, 0 services")

set(MSG_I_FLAGS "-Iarf_msgs:/home/odroid/catkin_ws/src/imu/arf_msgs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(arf_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/encoder.msg" NAME_WE)
add_custom_target(_arf_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arf_msgs" "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/encoder.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuRaw.msg" NAME_WE)
add_custom_target(_arf_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arf_msgs" "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuRaw.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuReal.msg" NAME_WE)
add_custom_target(_arf_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arf_msgs" "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuReal.msg" "geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/loc.msg" NAME_WE)
add_custom_target(_arf_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arf_msgs" "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/loc.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/img.msg" NAME_WE)
add_custom_target(_arf_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arf_msgs" "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/img.msg" "std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/rssi.msg" NAME_WE)
add_custom_target(_arf_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arf_msgs" "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/rssi.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/encoder.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs
)
_generate_msg_cpp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/rssi.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs
)
_generate_msg_cpp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuReal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs
)
_generate_msg_cpp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/loc.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs
)
_generate_msg_cpp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/img.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs
)
_generate_msg_cpp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuRaw.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(arf_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(arf_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(arf_msgs_generate_messages arf_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/encoder.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_cpp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuRaw.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_cpp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuReal.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_cpp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/loc.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_cpp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/img.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_cpp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/rssi.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_cpp _arf_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arf_msgs_gencpp)
add_dependencies(arf_msgs_gencpp arf_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arf_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/encoder.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs
)
_generate_msg_lisp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/rssi.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs
)
_generate_msg_lisp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuReal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs
)
_generate_msg_lisp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/loc.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs
)
_generate_msg_lisp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/img.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs
)
_generate_msg_lisp(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuRaw.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(arf_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(arf_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(arf_msgs_generate_messages arf_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/encoder.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_lisp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuRaw.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_lisp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuReal.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_lisp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/loc.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_lisp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/img.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_lisp _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/rssi.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_lisp _arf_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arf_msgs_genlisp)
add_dependencies(arf_msgs_genlisp arf_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arf_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/encoder.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs
)
_generate_msg_py(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/rssi.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs
)
_generate_msg_py(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuReal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs
)
_generate_msg_py(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/loc.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs
)
_generate_msg_py(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/img.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs
)
_generate_msg_py(arf_msgs
  "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuRaw.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(arf_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(arf_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(arf_msgs_generate_messages arf_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/encoder.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_py _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuRaw.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_py _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/imuReal.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_py _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/loc.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_py _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/img.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_py _arf_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/catkin_ws/src/imu/arf_msgs/msg/rssi.msg" NAME_WE)
add_dependencies(arf_msgs_generate_messages_py _arf_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arf_msgs_genpy)
add_dependencies(arf_msgs_genpy arf_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arf_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arf_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(arf_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(arf_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(arf_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arf_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(arf_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(arf_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(arf_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arf_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(arf_msgs_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(arf_msgs_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(arf_msgs_generate_messages_py sensor_msgs_generate_messages_py)
