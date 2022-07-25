#lang sicp

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x) (average guess (/ x guess)))

; relative error
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (* x 0.001)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
(sqrt-iter 1.0 x))

; square root of a small number
(sqrt (square 0.001))

; square root of a large number
(sqrt 1d13)