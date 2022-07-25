#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (if (< i 1) result
        (cont-frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
  (cont-frac-iter k 0))

(define (e-approximation k)
  (+ 2 
     (cont-frac 
      (lambda (i) 1.0) 
      (lambda (i) (if (= 2 (remainder i 3)) (/ (+ i 1) 1.5) 1))
      k)))

(e-approximation 8)