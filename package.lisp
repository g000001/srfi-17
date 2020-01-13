;;;; package.lisp

(cl:in-package #:cl-user)

(defpackage "https://github.com/g000001/srfi-17"
  (:use)
  (:export #:set! #:setter))

(defpackage "https://github.com/g000001/srfi-17#internals"
  (:use "https://github.com/g000001/srfi-17" #:cl #:fiveam))

