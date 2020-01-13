;;;; srfi-17.lisp

(cl:in-package "https://github.com/g000001/srfi-17#internals")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf (macro-function 'set!)
        (macro-function 'cl:setf)))

;; eof
