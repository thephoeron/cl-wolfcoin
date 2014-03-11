;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: WOLFCOIN; Base: 10 -*- file: blockchain.lisp

;;;; Copyright (c) 2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :wolfcoin)

(defvar *blockchain* (make-hash-table))

;; Maybe extend the block hash-id string to include timestamp and mint
(defun generate-block-hash ()
  "Generate a unique and random hash-id."
  (let ((ctx (isaac:init-kernel-seed :is64 t)))
    (format nil "~64,'0x" (isaac:rand-bits-64 ctx 1024))))

(defclass block ()
  ((id :initarg :id :reader id
       :documentation "The Hash-ID of the Block")
   (mint :initarg :mint :reader mint
         :documentation "The Mint of the block")
   (previous-block :initarg :previous-block :reader previous-block
                   :documentation "The Hash-ID of the previous block")
   (created-time :initarg :created-time :reader created-time
                 :documentation "The timestamp the block was created.")
   (transactions :initarg :transactions :accessor transactions
                 :documentation "The list of transactions on this block")))

(defgeneric valid-block-p (block)
  (:documentation "Block validator predicate."))

(defgeneric longest-chain-p (block)
  (:documentation "Ensure that current block is on the longest blockchain."))

(defgeneric push-block-to-blockchain (block blockchain)
  (:documentation "Push new block to local blockchain."))

;; EOF
