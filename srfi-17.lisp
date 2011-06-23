;;;; srfi-17.lisp

(cl:in-package :srfi-17-internal)

(def-suite srfi-17)

(in-suite srfi-17)

(setf (macro-function 'set!)
      (macro-function 'cl:setf))

(test set!
  (is (equal (let ((a (list 'a 'a 'a 'a)))
               (set! (car a) 1)
               a)
             '(1 A A A)))
  (let ((g (gensym)))
    (setf (fdefinition `(setter ,g))
          (fdefinition '(setf car)))
    (is (equal (let ((a (list 'a 'a 'a 'a)))
                 (funcall (coerce `(setter ,g) 'function) 1 a)
                 a)
               '(1 A A A)))))
