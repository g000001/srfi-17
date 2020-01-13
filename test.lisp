(cl:in-package "https://github.com/g000001/srfi-17#internals")

(5am:def-suite srfi-17)

(5am:in-suite srfi-17)

(5am:test set!
  (5am:is (equal (let ((a (list 'a 'a 'a 'a)))
                   (set! (car a) 1)
                   a)
                 '(1 A A A)))
  #+sbcl
  (let ((g (gensym)))
    (setf (fdefinition `(setter ,g))
          (fdefinition '(setf car)))
    (5am:is (equal (let ((a (list 'a 'a 'a 'a)))
                     (funcall (fdefinition `(setter ,g)) 1 a)
                     a)
                   '(1 A A A)))))
