#lang racket

(define (make-simplified-withdraw balance)
  (lambda (amount)
    (begin (set! balance (- balance amount))
	   balance)))


(define W (make-simplified-withdraw 25))

(W 20)

(W 10)


(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))

(define D (make-decrementer 25))

(D 20)

(D 10)
