(in-package :cl-user)

(defpackage :my-util-tests
  (:use :cl :my-util :5am))

(in-package :my-util-tests)

(def-suite my-util)
(in-suite  my-util)

(test ->string
  (is (string= (->string 1)    "1"))
  (is (string= (->string "1")  "1"))
  (is (string= (->string nil)  ""))
  (is (string= (->string 'a)   "A"))
  (is (string= (->string :a)   "A"))
  (is (string= (->string '(1)) "(1)")))

(test ->string-down
  (is (string= (->string-down "A") "a"))
  (is (string= (->string-down "a") "a"))
  (is (string= (->string-down 'a)  "a"))
  (is (string= (->string-down :a)  "a")))

(test ->string-up
  (is (string= (->string-up "A") "A"))
  (is (string= (->string-up "a") "A"))
  (is (string= (->string-up 'a)  "A"))
  (is (string= (->string-up :a)  "A")))

(test ->list
  (is (equal '(1) (->list 1)))
  (is (equal '(1) (->list '(1)))))

(test ->int
  (is (eq (->int 1)     1))
  (is (eq (->int "1")   1))
  (is (eq (->int '(1))  nil))
  (is (eq (->int "1.1") nil)))

(test ->keyword
  (is (eq :keyword (->keyword "keyword")))
  (is (eq :keyword (->keyword "KEYWORD")))
  (is (eq :keyword (->keyword 'keyword)))
  (is (eq :keyword (->keyword :keyword))))

(test ->symbol
  (is (eq 'symbol (->symbol "symbol")))
  (is (eq 'symbol (->symbol "SYMBOL")))
  (is (eq 'symbol (->symbol 'symbol)))
  (is (eq 'symbol (->symbol :symbol))))

(test concat
  (is (string= (concat 1 2 3)                      "123"))
  (is (string= (concat "1" "2" "3")                "123"))
  (is (string= (concat nil 1 nil 2 nil 3 nil)      "123"))
  (is (string= (concat nil "1" nil "2" nil "3"nil) "123")))

(test join
  (is (string= (join "," 1 2 3) "1,2,3"))
  (is (string= (join "," nil 1 nil 2 nil 3 nil) "1,2,3"))
  (is (string= (join "," "1" "2" "3") "1,2,3"))
  (is (string= (join "," nil "1" nil "2" nil "3"nil) "1,2,3")))
