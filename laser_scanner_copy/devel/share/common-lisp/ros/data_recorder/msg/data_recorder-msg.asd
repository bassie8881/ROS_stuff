
(cl:in-package :asdf)

(defsystem "data_recorder-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Fs_space" :depends-on ("_package_Fs_space"))
    (:file "_package_Fs_space" :depends-on ("_package"))
  ))