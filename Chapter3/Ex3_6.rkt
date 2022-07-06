#lang racket

(require "Ex3_5.rkt")


; I'm going to define a new rand that
;will solve will be the solution to this problem.

(define rand
  (let ((x 50))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define (rand-seed seed)
  (let ((internal -1))
    (if (= internal -1)
	(begin 
	  (printf "The value of internal: ~a \n" internal)
          (lambda ()
	    (set! internal (rand-update seed))
	    internal))
	2)))

(define (new-rand m)
  (define generate (rand))
  (define reset (lambda (x) (+ x 4)))
  (define (dispatch m)
    (cond ((eq? m 'generate) generate)
	  ((eq? m 'reset) reset)
	  (else (error "Unknown request -- MAKE-ACCOUNT" m))))
  (dispatch m))

((new-rand 'reset) 4) 
(new-rand 'generate)

((rand-seed 50))
((rand-seed 50))
