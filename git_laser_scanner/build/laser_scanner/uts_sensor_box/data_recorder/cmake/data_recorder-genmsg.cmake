# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "data_recorder: 1 messages, 0 services")

set(MSG_I_FLAGS "-Idata_recorder:/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(data_recorder_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg/Fs_space.msg" NAME_WE)
add_custom_target(_data_recorder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "data_recorder" "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg/Fs_space.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(data_recorder
  "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg/Fs_space.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/data_recorder
)

### Generating Services

### Generating Module File
_generate_module_cpp(data_recorder
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/data_recorder
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(data_recorder_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(data_recorder_generate_messages data_recorder_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg/Fs_space.msg" NAME_WE)
add_dependencies(data_recorder_generate_messages_cpp _data_recorder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(data_recorder_gencpp)
add_dependencies(data_recorder_gencpp data_recorder_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS data_recorder_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(data_recorder
  "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg/Fs_space.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/data_recorder
)

### Generating Services

### Generating Module File
_generate_module_lisp(data_recorder
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/data_recorder
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(data_recorder_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(data_recorder_generate_messages data_recorder_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg/Fs_space.msg" NAME_WE)
add_dependencies(data_recorder_generate_messages_lisp _data_recorder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(data_recorder_genlisp)
add_dependencies(data_recorder_genlisp data_recorder_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS data_recorder_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(data_recorder
  "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg/Fs_space.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/data_recorder
)

### Generating Services

### Generating Module File
_generate_module_py(data_recorder
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/data_recorder
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(data_recorder_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(data_recorder_generate_messages data_recorder_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/data_recorder/msg/Fs_space.msg" NAME_WE)
add_dependencies(data_recorder_generate_messages_py _data_recorder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(data_recorder_genpy)
add_dependencies(data_recorder_genpy data_recorder_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS data_recorder_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/data_recorder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/data_recorder
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(data_recorder_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/data_recorder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/data_recorder
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(data_recorder_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/data_recorder)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/data_recorder\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/data_recorder
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(data_recorder_generate_messages_py std_msgs_generate_messages_py)
