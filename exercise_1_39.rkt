#lang sicp

(define (square x)
  (* x x))

(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (if (< i 1) result
        (cont-frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
  (cont-frac-iter k 0))

(define (tan-cf x k)
  (cont-frac 
   (lambda (i) (if (= i 1) x (- (square x))))
   (lambda (i) (- (* 2 i) 1))
   k))

(tan-cf 1. 10)