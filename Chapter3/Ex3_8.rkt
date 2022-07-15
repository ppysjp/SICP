#lang racket


;; (define (f x)
;;   (let ((a 0))
;;     (begin (set! a (+ a 1))
;; 	   (- a x))))

;; (define (f x)
;;   (let ((a 0))
;;     (if (= x 1)
;; 	(begin (set! a (+ a 1))
;; 	       0)
;;       a)))

;; (define (g)
;;   (lambda (x)
;;     (let ((a 0))
;;       (display "The value of a: ")
;;       (display a)
;;       (display "\n")
;;       (if (= x 1)
;; 	  (begin (set! a (+ a 1))
;; 		 0)
;;           a))))

(define (g)
  (let ((a 0))
      (display "The value of a: ")
      (display a)
      (display "\n")
      (lambda (x)
	(if (= x 1)
	  (begin (set! a (+ a 1))
		 0)
          a))))

(define f1 (g))
(f1 0)
(f1 1)

(define f2 (g))
(f2 1)
(f2 0)







