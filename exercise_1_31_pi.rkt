#lang sicp

(define (even? n) (= (remainder n 2) 0))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (pi-approximation n)
  (define (frac x)
    (cond ((even? x) (/ x (+ x 1)))
          (else      (/ (+ x 1) x))
          )
    )
  (* 4 (product frac 2.0 inc n)))

(pi-approximation 10000)