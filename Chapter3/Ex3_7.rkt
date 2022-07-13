#lang racket

(require "Ex3_3.rkt")

(define (make-account balance password)
  (let ((C (make-counter))
	(passwords (list password)))
    (define (correct-password? passwords p)
      (cond ((null? passwords) false)
	((eq? (car passwords) p) true)
	(else (correct-password? (cdr passwords) p))))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insuffient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (call-the-cops) "Call the Cops!")
    (define (incorrect-password amount)
      (if (> ((C 'how-many-calls?)) 6)
	  (call-the-cops)
	  (begin ((C 'increment))
		 ((C 'how-many-calls?))
		 "Incorrect Password")))
    (define (dispatch p m)
      (cond ((not (eq? p password)) incorrect-password)
	    ((and (eq? p password) (eq? m 'withdraw)) withdraw)
	    ((and (eq? p password) (eq? m 'deposit)) deposit)
	    ((and (eq? p password) (eq? m 'balance)) balance)
	    (else (error "Unknown request -- MAKE-ACCOUNT" m))))
    dispatch))

(define peter-acc (make-account 100 'open-sesame))


((peter-acc 'open-sesame 'withdraw) 40)

(peter-acc 'open-sesame 'balance)


;; (define (make-joint account password new-password)
;;   )

(define (correct-password? passwords m)
  (cond ((null? passwords) false)
	((eq? (car passwords) m) true)
	(else (correct-password? (cdr passwords) m))))

(define passwords null)
;(define passwords (list 'open-sesame 'rose-bud))

(correct-password? passwords 'hello)
(correct-password? passwords 'open-sesame)
(correct-password? passwords 'rose-bud)

;; (define (make-joint account password new-password)
;;   (let ((passwords (list password new-password))
;; 	(count 0))
;;     (define (dispatch m)
;;       (cond ((eq? m 'how-many-calls?) calls)
;; 	    ((eq? m 'increment) increment)
;; 	    ((eq? m 'reset-count) reset)
;; 	    (else (error "Unknown request --MAKE-ACCUMULATOR" m))))
;;     dispatch))
