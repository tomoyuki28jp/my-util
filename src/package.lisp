(in-package :cl-user)

(macrolet
    ((define-package ()
       `(defpackage :my-util
          (:use :cl :anaphora :cl-ppcre)
          (:export ; --- util ---
                   :pm
                   :pm1
                   :when-let
                   :->string
                   :->string-down
                   :->string-up
                   :->list
                   :->int
                   :->keyword
                   :->symbol
                   :hash->alist
                   :concat
                   :join
                   ; --- anaphora ---
                   ,@(loop for s being the external-symbol
                           in :anaphora collect s)
                   ; --- cl-ppcre ---
                   ,@(loop for s being the external-symbol
                           in :cl-ppcre collect s)
                   ))))
  (define-package))
