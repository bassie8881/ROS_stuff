; Auto-generated. Do not edit!


(cl:in-package rosserial_arduino-msg)


;//! \htmlinclude rgb.msg.html

(cl:defclass <rgb> (roslisp-msg-protocol:ros-message)
  ((r
    :reader r
    :initarg :r
    :type cl:fixnum
    :initform 0)
   (g
    :reader g
    :initarg :g
    :type cl:fixnum
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:fixnum
    :initform 0))
)

(cl:defclass rgb (<rgb>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rgb>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rgb)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rosserial_arduino-msg:<rgb> is deprecated: use rosserial_arduino-msg:rgb instead.")))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <rgb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:r-val is deprecated.  Use rosserial_arduino-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'g-val :lambda-list '(m))
(cl:defmethod g-val ((m <rgb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:g-val is deprecated.  Use rosserial_arduino-msg:g instead.")
  (g m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <rgb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_arduino-msg:b-val is deprecated.  Use rosserial_arduino-msg:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rgb>) ostream)
  "Serializes a message object of type '<rgb>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rgb>) istream)
  "Deserializes a message object of type '<rgb>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rgb>)))
  "Returns string type for a message object of type '<rgb>"
  "rosserial_arduino/rgb")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rgb)))
  "Returns string type for a message object of type 'rgb"
  "rosserial_arduino/rgb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rgb>)))
  "Returns md5sum for a message object of type '<rgb>"
  "353891e354491c51aabe32df673fb446")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rgb)))
  "Returns md5sum for a message object of type 'rgb"
  "353891e354491c51aabe32df673fb446")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rgb>)))
  "Returns full string definition for message of type '<rgb>"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rgb)))
  "Returns full string definition for message of type 'rgb"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rgb>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rgb>))
  "Converts a ROS message object to a list"
  (cl:list 'rgb
    (cl:cons ':r (r msg))
    (cl:cons ':g (g msg))
    (cl:cons ':b (b msg))
))
