#lang racket

(require "Ex3_3.rkt")

(define peter-acc (make-account 100 'open-sesame))


((peter-acc 'open-sesame 'withdraw) 40)

(peter-acc 'open-sesame 'balance)


;; (define (make-joint account password new-password)
;;   )

(define (correct-password? passwords m)
  (cond ((null? passwords) false)
	((eq? (car passwords) m) true)
	(else (correct-password? (cdr passwords) m))))

(define passwords (list 'open-sesame 'rose-bud))

(correct-password? passwords 'hello)
(correct-password? passwords 'open-sesame)
(correct-password? passwords 'rose-bud)
