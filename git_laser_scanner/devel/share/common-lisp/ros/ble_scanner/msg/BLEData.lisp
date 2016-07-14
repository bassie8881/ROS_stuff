; Auto-generated. Do not edit!


(cl:in-package ble_scanner-msg)


;//! \htmlinclude BLEData.msg.html

(cl:defclass <BLEData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type (cl:vector ble_scanner-msg:BLEBeacon)
   :initform (cl:make-array 0 :element-type 'ble_scanner-msg:BLEBeacon :initial-element (cl:make-instance 'ble_scanner-msg:BLEBeacon))))
)

(cl:defclass BLEData (<BLEData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BLEData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BLEData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ble_scanner-msg:<BLEData> is deprecated: use ble_scanner-msg:BLEData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BLEData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_scanner-msg:header-val is deprecated.  Use ble_scanner-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <BLEData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_scanner-msg:data-val is deprecated.  Use ble_scanner-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BLEData>) ostream)
  "Serializes a message object of type '<BLEData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BLEData>) istream)
  "Deserializes a message object of type '<BLEData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ble_scanner-msg:BLEBeacon))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BLEData>)))
  "Returns string type for a message object of type '<BLEData>"
  "ble_scanner/BLEData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BLEData)))
  "Returns string type for a message object of type 'BLEData"
  "ble_scanner/BLEData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BLEData>)))
  "Returns md5sum for a message object of type '<BLEData>"
  "c29e26215bed4fe2e33bea8e9a9a6399")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BLEData)))
  "Returns md5sum for a message object of type 'BLEData"
  "c29e26215bed4fe2e33bea8e9a9a6399")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BLEData>)))
  "Returns full string definition for message of type '<BLEData>"
  (cl:format cl:nil "Header header       # timestamp~%BLEBeacon[] data  # BLE data of all beacons~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: ble_scanner/BLEBeacon~%string mac_address # MAC address of an access point~%int16 rssi         # signal strength [RSSI]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BLEData)))
  "Returns full string definition for message of type 'BLEData"
  (cl:format cl:nil "Header header       # timestamp~%BLEBeacon[] data  # BLE data of all beacons~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: ble_scanner/BLEBeacon~%string mac_address # MAC address of an access point~%int16 rssi         # signal strength [RSSI]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BLEData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BLEData>))
  "Converts a ROS message object to a list"
  (cl:list 'BLEData
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
