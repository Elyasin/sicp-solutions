#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(accumulate * 1 identity 1 inc 5) ; 120
(accumulate + 0 identity 1 inc 5) ;  15