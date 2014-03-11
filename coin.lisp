;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: WOLFCOIN; Base: 10 -*- file: coin.lisp

;;;; Copyright (c) 2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :wolfcoin)

(defclass coin ()
  ((value :initarg :value :initval 0 :accessor value
          :documentation "The value of the current coin.")
   (block :initarg :block :initval nil :accessor block
          :documentation "The hash-id of the source block.")
   (origin :initarg :origin :initval nil :accessor origin
           :documentation "Origin of current coin, a verifiable transaction list.")
   (created-date :initarg :created-date :initval (local-time:today) :reader created-date
                 :documentation "The LOCAL-TIME date object instance for when the coin was created.")))

(defgeneric valid-origin-p (coin)
  (:documentation "Coin origin validation predicate."))

;; EOF