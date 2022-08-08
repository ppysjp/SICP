#lang racket

(require compatibility/mlist)

(define (append x y)
	(if (null? x)
		y
		(mcons (mcar x) (append (mcdr x) y))))

(define (append! x y)
	(set-mcdr! (last-pair x) y)
	x)


(define (last-pair x)
	(if (null? (mcdr x))
		x
		(last-pair (mcdr x))))

(define x (mlist 'a 'b))
(define y (mlist 'c 'd))
(define z (append x y))

z

(mcdr x)

x

; naturally I think this will be ('b null)

(define w (append! x y))

w

(mcdr x)
