#lang racket

(require "Ex3_3.rkt")

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
