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
  (let ((seed 0))
    (define (dispatch m)
      (cond ((eq? m 'reset) (lambda (x)
			      (begin (set! seed x)
					   seed)))
	    ((eq? m 'generate)(begin (set! seed (rand-update seed))
				    	   seed))
	    (else (error "Unknown request --RANDOM-NUMBER-GENERATOR" m))))
    dispatch))


(define rand (r))

((rand 'reset) 0)
(rand 'generate)
(rand 'generate)
((rand 'reset) 6)
(rand 'generate)
(rand 'generate)
((rand 'reset) 0)
(rand 'generate)
(rand 'generate)






