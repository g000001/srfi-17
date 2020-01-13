;;;; srfi-17.asd

(cl:in-package :asdf)

(defsystem :srfi-17
    :version "1"
    :description "SRFI 17 for CL: Generalized set!"
    :long-description "SRFI 17 for CL: Generalized set!
https://srfi.schemers.org/srfi-17"
    :author "CHIBA Masaomi"
    :maintainer "CHIBA Masaomi"
    :license "Unlicense"
    :serial t
    :depends-on ()
    :components ((:file "package")
                 (:file "srfi-17-impl")
                 (:file "srfi-17")))

(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-17))))
  (let ((name "https://github.com/g000001/srfi-17")
        (nickname :srfi-17))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))

(defsystem :srfi-17.test
  :version "1"
  :description "SRFI 17 for CL: Generalized set!"
  :long-description "SRFI 17 for CL: Generalized set!
https://srfi.schemers.org/srfi-17"
  :author "CHIBA Masaomi"
  :maintainer "CHIBA Masaomi"
  :license "Unlicense"
  :depends-on (:srfi-17 :fiveam)
  :components ((:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-17.test))))
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
        (let ((result (funcall (_ :fiveam :run) (_ "https://github.com/g000001/srfi-17#internals" :srfi-17))))
          (funcall (_ :fiveam :explain!) result)
          (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))
