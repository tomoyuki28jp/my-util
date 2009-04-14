(in-package :cl-user)

(defpackage :my-util-asd (:use :cl :asdf))

(in-package :my-util-asd)

(defsystem  :my-util
  :version  "0.0.2"
  :name     "my-util"
  :author   "Tomoyuki Matsumoto <tomoyuki28jp@no-spam@yahoo.co.jp>"
  :licence  "BSD"
  :description "My Common Lisp Utilities"
  :depends-on  (:anaphora :cl-ppcre)
  :components  ((:module "src"
                         :serial  t
                         :components
                         ((:file "package")
                          (:file "my-util")))))
