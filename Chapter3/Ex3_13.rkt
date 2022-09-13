#lang racket
(require compatibility/mlist)

(define (last-pair x)
	(if (null? (mcdr x))
		x
		(last-pair (mcdr x))))

(define (append! x y)
	(set-mcdr! (last-pair x) y)
	x)

(define (make-cycle x)
	(set-mcdr! (last-pair x) x)
	x)

; What is the box pointer that is formed from this mutable list to create z?

(define z (make-cycle (mlist 'a 'b 'c)))

z

;(last-pair z)