#lang sicp

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; infinite loop due to applicative order evaluation
(test 0 (p))