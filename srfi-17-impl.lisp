(cl:in-package "https://github.com/g000001/srfi-17#internals")

#+sbcl
(sb-int:define-function-name-syntax setter (name)
  (when (and (cdr name)
             (consp (cdr name)))
    (destructuring-bind (fun &rest rest) (cdr name)
      (when (null rest)
        (typecase fun
          ;; ordinary (SETF FOO) case
          (symbol (values t fun))
          ;; reasonable (SETF (QUUX BAZ)) case [but not (SETF (SETF
          ;; FOO))]
          (cons (unless (member (car fun) '(setter cl:setf))
                  (sb-int:valid-function-name-p fun))))))))

;; eof
