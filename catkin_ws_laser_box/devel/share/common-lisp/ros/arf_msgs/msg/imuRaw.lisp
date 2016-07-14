; Auto-generated. Do not edit!


(cl:in-package arf_msgs-msg)


;//! \htmlinclude imuRaw.msg.html

(cl:defclass <imuRaw> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (accelerometer
    :reader accelerometer
    :initarg :accelerometer
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (magnetometer
    :reader magnetometer
    :initarg :magnetometer
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (gyroscope
    :reader gyroscope
    :initarg :gyroscope
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (RPY
    :reader RPY
    :initarg :RPY
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass imuRaw (<imuRaw>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <imuRaw>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'imuRaw)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arf_msgs-msg:<imuRaw> is deprecated: use arf_msgs-msg:imuRaw instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <imuRaw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:header-val is deprecated.  Use arf_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'accelerometer-val :lambda-list '(m))
(cl:defmethod accelerometer-val ((m <imuRaw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:accelerometer-val is deprecated.  Use arf_msgs-msg:accelerometer instead.")
  (accelerometer m))

(cl:ensure-generic-function 'magnetometer-val :lambda-list '(m))
(cl:defmethod magnetometer-val ((m <imuRaw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:magnetometer-val is deprecated.  Use arf_msgs-msg:magnetometer instead.")
  (magnetometer m))

(cl:ensure-generic-function 'gyroscope-val :lambda-list '(m))
(cl:defmethod gyroscope-val ((m <imuRaw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:gyroscope-val is deprecated.  Use arf_msgs-msg:gyroscope instead.")
  (gyroscope m))

(cl:ensure-generic-function 'RPY-val :lambda-list '(m))
(cl:defmethod RPY-val ((m <imuRaw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:RPY-val is deprecated.  Use arf_msgs-msg:RPY instead.")
  (RPY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <imuRaw>) ostream)
  "Serializes a message object of type '<imuRaw>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'accelerometer) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'magnetometer) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gyroscope) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RPY) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <imuRaw>) istream)
  "Deserializes a message object of type '<imuRaw>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'accelerometer) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'magnetometer) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gyroscope) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RPY) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<imuRaw>)))
  "Returns string type for a message object of type '<imuRaw>"
  "arf_msgs/imuRaw")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'imuRaw)))
  "Returns string type for a message object of type 'imuRaw"
  "arf_msgs/imuRaw")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<imuRaw>)))
  "Returns md5sum for a message object of type '<imuRaw>"
  "5eb268536d2c65c632dfa193105c79b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'imuRaw)))
  "Returns md5sum for a message object of type 'imuRaw"
  "5eb268536d2c65c632dfa193105c79b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<imuRaw>)))
  "Returns full string definition for message of type '<imuRaw>"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Vector3 accelerometer~%geometry_msgs/Vector3 magnetometer~%geometry_msgs/Vector3 gyroscope~%geometry_msgs/Vector3 RPY~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'imuRaw)))
  "Returns full string definition for message of type 'imuRaw"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Vector3 accelerometer~%geometry_msgs/Vector3 magnetometer~%geometry_msgs/Vector3 gyroscope~%geometry_msgs/Vector3 RPY~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <imuRaw>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'accelerometer))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'magnetometer))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gyroscope))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RPY))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <imuRaw>))
  "Converts a ROS message object to a list"
  (cl:list 'imuRaw
    (cl:cons ':header (header msg))
    (cl:cons ':accelerometer (accelerometer msg))
    (cl:cons ':magnetometer (magnetometer msg))
    (cl:cons ':gyroscope (gyroscope msg))
    (cl:cons ':RPY (RPY msg))
))
