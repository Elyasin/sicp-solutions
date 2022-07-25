#lang sicp

(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
        result
        (accumulate-iter (next a) (combiner (term a) result))))
  (accumulate-iter a null-value))

(accumulate * 1 identity 1 inc 5) ; 120
(accumulate + 0 identity 1 inc 5) ;  15