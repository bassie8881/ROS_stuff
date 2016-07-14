; Auto-generated. Do not edit!


(cl:in-package data_recorder-msg)


;//! \htmlinclude Fs_space.msg.html

(cl:defclass <Fs_space> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (fs_size
    :reader fs_size
    :initarg :fs_size
    :type cl:integer
    :initform 0)
   (fs_space
    :reader fs_space
    :initarg :fs_space
    :type cl:integer
    :initform 0))
)

(cl:defclass Fs_space (<Fs_space>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Fs_space>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Fs_space)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name data_recorder-msg:<Fs_space> is deprecated: use data_recorder-msg:Fs_space instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Fs_space>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader data_recorder-msg:header-val is deprecated.  Use data_recorder-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'fs_size-val :lambda-list '(m))
(cl:defmethod fs_size-val ((m <Fs_space>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader data_recorder-msg:fs_size-val is deprecated.  Use data_recorder-msg:fs_size instead.")
  (fs_size m))

(cl:ensure-generic-function 'fs_space-val :lambda-list '(m))
(cl:defmethod fs_space-val ((m <Fs_space>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader data_recorder-msg:fs_space-val is deprecated.  Use data_recorder-msg:fs_space instead.")
  (fs_space m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Fs_space>) ostream)
  "Serializes a message object of type '<Fs_space>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fs_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fs_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'fs_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'fs_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'fs_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'fs_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'fs_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'fs_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fs_space)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fs_space)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'fs_space)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'fs_space)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'fs_space)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'fs_space)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'fs_space)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'fs_space)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Fs_space>) istream)
  "Deserializes a message object of type '<Fs_space>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fs_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fs_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'fs_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'fs_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'fs_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'fs_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'fs_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'fs_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fs_space)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fs_space)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'fs_space)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'fs_space)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'fs_space)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'fs_space)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'fs_space)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'fs_space)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Fs_space>)))
  "Returns string type for a message object of type '<Fs_space>"
  "data_recorder/Fs_space")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Fs_space)))
  "Returns string type for a message object of type 'Fs_space"
  "data_recorder/Fs_space")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Fs_space>)))
  "Returns md5sum for a message object of type '<Fs_space>"
  "3fb8eb0b826534256f6179d733e3ffbc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Fs_space)))
  "Returns md5sum for a message object of type 'Fs_space"
  "3fb8eb0b826534256f6179d733e3ffbc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Fs_space>)))
  "Returns full string definition for message of type '<Fs_space>"
  (cl:format cl:nil "std_msgs/Header header~%uint64 fs_size~%uint64 fs_space~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Fs_space)))
  "Returns full string definition for message of type 'Fs_space"
  (cl:format cl:nil "std_msgs/Header header~%uint64 fs_size~%uint64 fs_space~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Fs_space>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Fs_space>))
  "Converts a ROS message object to a list"
  (cl:list 'Fs_space
    (cl:cons ':header (header msg))
    (cl:cons ':fs_size (fs_size msg))
    (cl:cons ':fs_space (fs_space msg))
))
