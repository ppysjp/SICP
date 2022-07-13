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
    (define (additional-access new-password)
      (begin (set! passwords (cons new-password passwords))))
    ;; (define (incorrect-password)
    ;;   (if (> ((C 'how-many-calls?)) 6)
    ;; 	  (call-the-cops)
    ;; 	  (begin ((C 'increment))
    ;; 		 ((C 'how-many-calls?))
    ;; 		 "Incorrect Password")))
    (define (dispatch p m)
      (cond ;((not (correct-password? passwords p)) incorrect-password)
	    ((not (correct-password? passwords p)) (display "Incorrect Password\n"))
	    ((and (correct-password? passwords p) (eq? m 'withdraw)) withdraw)
	    ((and (correct-password? passwords p) (eq? m 'deposit)) deposit)
	    ((and (correct-password? passwords p) (eq? m 'balance)) balance)
	    ((and (correct-password? passwords p) (eq? m 'additional-access))
	     additional-access)
	    (else (error "Unknown request -- MAKE-ACCOUNT" m))))
    dispatch))

(define peter-acc (make-account 100 'open-sesame))


((peter-acc 'open-sesame 'withdraw) 40)

(peter-acc 'open-sesame 'balance)
(peter-acc 'wrong-password 'balance)

(display "At the moment the balance isn't displayed")
(display "Using the additonal access method we should access the balance.\n")

((peter-acc 'open-sesame 'additional-access) 'wrong-password)
(peter-acc 'wrong-password 'balance)



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


