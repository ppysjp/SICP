#lang racket

(define (make-simplified-withdraw balance)
  (lambda (amount)
    (begin (set! balance (-balance amount))
	  balance)))


(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))

(define D1 (make-decrementer 25))
(define D2 (make-decrementer 25))

(define W1 (make-simplified-withdraw 25))
(define W2 (make-simplified-withdraw 25))


(define (make-account balance)
  (define (withdraw amount)
    (if (>- balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Unknown request -- MaKE-ACCOUNT" m))))
  dispatch)
