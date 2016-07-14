
(cl:in-package :asdf)

(defsystem "ble_scanner-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BLEBeacon" :depends-on ("_package_BLEBeacon"))
    (:file "_package_BLEBeacon" :depends-on ("_package"))
    (:file "BLEData" :depends-on ("_package_BLEData"))
    (:file "_package_BLEData" :depends-on ("_package"))
  ))