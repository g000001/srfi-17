#+sbcl
(in-package :sb-impl)

#+sbcl
(define-function-name-syntax srfi-17:setter (name)
  (when (and (cdr name)
             (consp (cdr name)))
    (destructuring-bind (fun &rest rest) (cdr name)
      (when (null rest)
        (typecase fun
          ;; ordinary (SETF FOO) case
          (symbol (values t fun))
          ;; reasonable (SETF (QUUX BAZ)) case [but not (SETF (SETF
          ;; FOO))]
          (cons (unless (member (car fun) '(srfi-17:setter cl:setf))
                  (valid-function-name-p fun))))))))

;; eof