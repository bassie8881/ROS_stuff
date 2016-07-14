
(cl:in-package :asdf)

(defsystem "arf_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "loc" :depends-on ("_package_loc"))
    (:file "_package_loc" :depends-on ("_package"))
    (:file "rssi" :depends-on ("_package_rssi"))
    (:file "_package_rssi" :depends-on ("_package"))
    (:file "img" :depends-on ("_package_img"))
    (:file "_package_img" :depends-on ("_package"))
    (:file "encoder" :depends-on ("_package_encoder"))
    (:file "_package_encoder" :depends-on ("_package"))
    (:file "imuRaw" :depends-on ("_package_imuRaw"))
    (:file "_package_imuRaw" :depends-on ("_package"))
    (:file "imuReal" :depends-on ("_package_imuReal"))
    (:file "_package_imuReal" :depends-on ("_package"))
  ))