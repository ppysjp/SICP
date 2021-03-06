(define (square x) (* x x))

(define (make-from-real-imag x y) 
  (define (dispatch op) 
    (cond ((eq? op 'real-part) x) 
          ((eq? op 'imag-part) y) 
          ((eq? op 'magnitude) 
           (sqrt (+ (square x) (square y)))) 
          ((eq? op 'angle) (atan y x)) 
          (else (error "Unkown op -- MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define z1 (make-from-real-imag 1 1))


(z1 'real-part)
(z1 'imag-part)
(z1 'magnitude)
(z1 'angle)
