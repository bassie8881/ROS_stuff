; Auto-generated. Do not edit!


(cl:in-package arf_msgs-msg)


;//! \htmlinclude rssi.msg.html

(cl:defclass <rssi> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (rssi
    :reader rssi
    :initarg :rssi
    :type cl:string
    :initform ""))
)

(cl:defclass rssi (<rssi>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rssi>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rssi)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arf_msgs-msg:<rssi> is deprecated: use arf_msgs-msg:rssi instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <rssi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:header-val is deprecated.  Use arf_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'rssi-val :lambda-list '(m))
(cl:defmethod rssi-val ((m <rssi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arf_msgs-msg:rssi-val is deprecated.  Use arf_msgs-msg:rssi instead.")
  (rssi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rssi>) ostream)
  "Serializes a message object of type '<rssi>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rssi))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rssi>) istream)
  "Deserializes a message object of type '<rssi>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rssi) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rssi) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rssi>)))
  "Returns string type for a message object of type '<rssi>"
  "arf_msgs/rssi")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rssi)))
  "Returns string type for a message object of type 'rssi"
  "arf_msgs/rssi")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rssi>)))
  "Returns md5sum for a message object of type '<rssi>"
  "e8e56e8af55f4e2211ec762c93d9fda9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rssi)))
  "Returns md5sum for a message object of type 'rssi"
  "e8e56e8af55f4e2211ec762c93d9fda9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rssi>)))
  "Returns full string definition for message of type '<rssi>"
  (cl:format cl:nil "std_msgs/Header header~%string rssi~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rssi)))
  "Returns full string definition for message of type 'rssi"
  (cl:format cl:nil "std_msgs/Header header~%string rssi~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rssi>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'rssi))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rssi>))
  "Converts a ROS message object to a list"
  (cl:list 'rssi
    (cl:cons ':header (header msg))
    (cl:cons ':rssi (rssi msg))
))
