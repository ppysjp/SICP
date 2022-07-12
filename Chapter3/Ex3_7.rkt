#lang racket

(require "Ex3_3.rkt")

(define peter-acc (make-account 100 'open-sesame))


((peter-acc 'open-sesame 'withdraw) 40)

(peter-acc 'open-sesame 'balance)


;; (define (make-joint account password new-password)
;;   )
