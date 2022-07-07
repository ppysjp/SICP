#lang racket

(require "Ex3_5.rkt")


; I'm going to define a new rand that
;will solve will be the solution to this problem.

(define (r)
  (let ((seed 0)
	(define (dispatch m)
	  (cond ((eq? m 'reset) (lambda (x (set! seed x))))
		((eq? m 'generate) (begin (set! seed (rand-update seed))
					  seed))
		(else error "invalid operation")))
	dispatch)))

(define rand (r))

(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)



