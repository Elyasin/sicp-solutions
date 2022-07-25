#lang sicp

; definition of cube procedure
(define (cube x) 
  (* x x x))

; approximation used for cube root algorithm
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) (* x 0.001)))

(define (cbrt-iter guess x)
   (if (good-enough? guess x)
   guess
   (cbrt-iter (improve guess x) x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt (* 4 4 4))
(cbrt (* 0.001 0.001 0.001))
(cbrt (* 1d13 1d13 1d13))
