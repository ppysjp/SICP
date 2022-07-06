#lang racket

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))


(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (make-accumulator initial)
  (lambda (amount)
    (begin (set! initial (+ initial amount))
	   initial)))

(define (make-monitored-wishful f)
  (lambda (input)
    (if (eq? input 'how-many-calls?)
	"Number of Counts"
	(if (eq? input 'reset-count)
	    "Reset Count"
	    (begin (f input)
		   ("Increment Counter"))))))

(sqrt 2)

(define s (make-monitored-wishful sqrt))

;; Could be refactored to use cond or 'or'

(s 'how-many-calls?)
(s 'reset-count)
;;(s 100)

(define (make-counter)
  (let ((accumulator (make-accumulator 0))
	(count 0))
    (define (calls) count)
    (define (increment) (set! count (accumulator 1)))
    (define (reset) (begin (set! accumulator (make-accumulator 0))
			   (set! count 0)))
    (define (dispatch m)
      (cond ((eq? m 'how-many-calls?) calls)
	    ((eq? m 'increment) increment)
	    ((eq? m 'reset-count) reset)
	    (else (error "Unknown request --MAKE-ACCUMULATOR" m))))
    dispatch))

(define C (make-counter))

((C 'how-many-calls?))
((C 'increment))
((C 'increment))
((C 'how-many-calls?))
((C 'reset-count))
((C 'how-many-calls?))


(define (make-monitored f)
  (let ((C (make-counter)))
   (lambda (input)
     (if (or (eq? input 'how-many-calls?)
	     (eq? input 'reset-count))
	 ((C input))
	 (begin ((C 'increment))
		(f input))))))

(define s1 (make-monitored sqrt))

;; Could be refactored to use cond.

(s1 100)
(s1 'how-many-calls?)
(s1 'reset-count)
(s1 'how-many-calls?)

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))


(define f (make-monitored factorial))

(f 5)

(f 'how-many-calls?)

(f 2)

(f 'how-many-calls?)
