(in-package :my-util)

; --- Debugging -------------------------------------------------

(defmacro pm  (expr)  `(pprint (macroexpand   ',expr)))
(defmacro pm1 (expr)  `(pprint (macroexpand-1 ',expr)))

; --- Binding constructs ----------------------------------------

(defmacro when-let ((var form) &body body)
  `(let ((,var ,form))
     (when ,var ,@body)))

; --- Type casting ----------------------------------------------

(defun ->string (x)
  (if (stringp x)
      x
      (with-output-to-string (s)
        (when x (princ x s)))))

(defun ->string-down (x) (string-downcase (->string x)))
(defun ->string-up   (x) (string-upcase   (->string x)))

(defun ->list (x)
  (if (listp x)
      x
      (list x)))

(defun ->int (x)
  (if (integerp x)
    x
    (ignore-errors (parse-integer x))))

(defun ->keyword (x)
  (if (keywordp x)
      x
      (intern (->string-up x) :keyword)))

(defun ->symbol (x)
  (intern (->string (->string-up x))))

; --- Strings ---------------------------------------------------

(defun concat (&rest args)
  (apply #'concatenate 'string (mapcar #'->string args)))

(defun join (joiner &rest args)
  (format nil (concat "~{~A~^" (->string joiner) "~}")
          (remove nil args)))
