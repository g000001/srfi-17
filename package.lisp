;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-17
  (:use)
  (:export :set! :setter))

(defpackage :srfi-17-internal
  (:use :srfi-17 :cl :fiveam))

