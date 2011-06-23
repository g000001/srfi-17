;;;; srfi-17.asd

(cl:in-package :asdf)

(defsystem :srfi-17
  :serial t
  :components ((:file "package")
               (:file "srfi-17-impl")
               (:file "srfi-17")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-17))))
  (load-system :srfi-17)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-17-internal :srfi-17))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))

