#lang sicp

(define tolerance 0.00001)

(define (average a b) (/ (+ a b) 2))

(define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))

(define (iterative-improve good-enough? fn)
  (lambda (guess) (if (good-enough? guess (fn guess)) 
                      guess 
                      ((iterative-improve good-enough? fn) (fn guess)))))

(define (sqrt x)
  ((iterative-improve close-enough? (lambda (y) (average y (/ x y)))) 1.0))

(define (fixed-point f guess)
  ((iterative-improve close-enough? (lambda (y) (f y))) guess))

(sqrt 9)
(fixed-point cos 1.0)