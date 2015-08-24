;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: WOLFCOIN; Base: 10 -*-
;;;; file: packages.lisp

;;;; Copyright (c) 2014--2015, "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :cl-user)

(defpackage #:wolfcoin
  (:nicknames #:wlf #:wolf)
  (:use :cl
        :cl-user
        :lparallel
        :local-time
        :ironclad
        :cl-isaac
        :cl-json
        :babel
        :cl-store
        :cl-p2p)
  (:export #:start-wolfcoin
           #:stop-wolfcoin
           #:restart-wolfcoin))

(defpackage #:wolfcoin-wallet
  (:nicknames #:wlf-w #:wolf-wallet)
  (:use :cl
        :cl-user
        :local-time
        :ironclad
        :cl-isaac
        :babel
        :cl-store
        :wolfcoin))

(defpackage #:wolfcoin-rpc
  (:nicknames #:wlf-rpc #:wolf-rpc)
  (:use :cl :cl-user :local-time :ironclad :cl-isaac :babel :hunchentoot :cl-json :wolfcoin :wolfcoin-wallet))

(defpackage #:wolfcoin-client
  (:nicknames #:wlf-ltk #:wolf-ltk)
  (:use :cl :cl-user :ltk :ironclad :cl-isaac :babel :cl-json :wolfcoin :wolfcoin-wallet :wolfcoin-rpc))

(defpackage #:wolfcoin-ecdsa
  (:nicknames #:wlf-ecdsa #:wolf-ecdsa)
  (:use :cl :cl-user :ironclad :cl-isaac))

;; EOF
