#lang racket


;; (define (f x)
;;   (let ((a 0))
;;     (begin (set! a (+ a 1))
;; 	   (- a x))))





(define (f x)
  (let ((a 0))
    (if (= x 1)
	(begin (set! a (+ a 1))
	       0)
      a)))


(define f1 (f 1))
f1

(define f0 (f 0))
f0





