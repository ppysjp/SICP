#lang racket

;; (define (make-withdraw initial-amount)
;;   (let ((balance initial-amount))
;;     (lambda (amount)
;;       (if (>= balance amount)
;; 	  (begin (set! balance (- balance amount))
;; 		 balance)
;; 	  "Insufficient funds"))))

(define (make-withdraw initial-amount)
  ((lambda (balance)
     (lambda (amount)
       (if (>= balance amount)
	   (begin (set! balance (- balance amount))
		  balance)
	   "Insufficient funds")))
   initial-amount))

(define make-withdraw
  (lambda (initial-amount)
    ((lambda (balance)
       (lambda (amount)
	 (if (>= balance amount)
	     (begin (set! balance (- balance amount))
		    balance)
	     "Insufficient funds")))
     initial-amount)))



(define W1 (make-withdraw 100))

(W1 50)

(define W2 (make-withdraw 100))

(W2 20)

(define square (lambda (x) (* x x)))

(square 3)



