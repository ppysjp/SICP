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
