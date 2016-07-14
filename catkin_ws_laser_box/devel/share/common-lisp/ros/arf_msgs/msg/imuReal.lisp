; Auto-generated. Do not edit!


(cl:in-package arf_msgs-msg)


;//! \htmlinclude imuReal.msg.html

(cl:defclass <imuReal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (orientation
    :reader orientation
    :initarg :orientation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (RPY
    :reader RPY
    :initarg :RPY
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (angular_velocity
    :reader angular_velocity
    :initarg :angular_velocity
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (linear_acceleration
    :reader linear_acceleration
    :initarg :linear_acceleration
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass imuReal (<imuReal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <imuReal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'imuReal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arf_msgs-msg:<imuReal> is deprecated: use arf_msgs-msg:imuReal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <imuReal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:header-val is deprecated.  Use arf_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <imuReal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:orientation-val is deprecated.  Use arf_msgs-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'RPY-val :lambda-list '(m))
(cl:defmethod RPY-val ((m <imuReal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:RPY-val is deprecated.  Use arf_msgs-msg:RPY instead.")
  (RPY m))

(cl:ensure-generic-function 'angular_velocity-val :lambda-list '(m))
(cl:defmethod angular_velocity-val ((m <imuReal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:angular_velocity-val is deprecated.  Use arf_msgs-msg:angular_velocity instead.")
  (angular_velocity m))

(cl:ensure-generic-function 'linear_acceleration-val :lambda-list '(m))
(cl:defmethod linear_acceleration-val ((m <imuReal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:linear_acceleration-val is deprecated.  Use arf_msgs-msg:linear_acceleration instead.")
  (linear_acceleration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <imuReal>) ostream)
  "Serializes a message object of type '<imuReal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RPY) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_acceleration) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <imuReal>) istream)
  "Deserializes a message object of type '<imuReal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RPY) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_acceleration) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<imuReal>)))
  "Returns string type for a message object of type '<imuReal>"
  "arf_msgs/imuReal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'imuReal)))
  "Returns string type for a message object of type 'imuReal"
  "arf_msgs/imuReal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<imuReal>)))
  "Returns md5sum for a message object of type '<imuReal>"
  "2db69072b241a8783669931675beeea0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'imuReal)))
  "Returns md5sum for a message object of type 'imuReal"
  "2db69072b241a8783669931675beeea0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<imuReal>)))
  "Returns full string definition for message of type '<imuReal>"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Quaternion orientation~%geometry_msgs/Vector3 RPY~%geometry_msgs/Vector3 angular_velocity~%geometry_msgs/Vector3 linear_acceleration~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'imuReal)))
  "Returns full string definition for message of type 'imuReal"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Quaternion orientation~%geometry_msgs/Vector3 RPY~%geometry_msgs/Vector3 angular_velocity~%geometry_msgs/Vector3 linear_acceleration~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <imuReal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RPY))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_acceleration))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <imuReal>))
  "Converts a ROS message object to a list"
  (cl:list 'imuReal
    (cl:cons ':header (header msg))
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':RPY (RPY msg))
    (cl:cons ':angular_velocity (angular_velocity msg))
    (cl:cons ':linear_acceleration (linear_acceleration msg))
))
