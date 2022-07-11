#lang racket

; I'm going to define a new rand that
;will solve will be the solution to this problem.

(define (dispatch m)
      (cond ((eq? m 'reset) (print "RESET"))
	    ((eq? m 'generate) (print "GENERATE"))
	    (else (error "Unknown request --RANDOM-NUMBER-GENERATOR" m))))


(define (rand-update x)
  (let ((a 75)
	(b 74)
	(m (+ 1 (expt 2 16))))
    (modulo (+ (* a x) b) m)))

(define (r)
  (define (dispatch m)
      (cond ((eq? m 'reset) (print "RESET"))
	    ((eq? m 'generate) (print "GENERATE"))
	    (else (error "Unknown request --RANDOM-NUMBER-GENERATOR" m))))
  dispatch)


(define rand (r))

(rand 'reset)
(rand 'generate)






