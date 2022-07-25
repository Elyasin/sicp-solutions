#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-helper i)
    (if (> i k) 0
        (/ (n i) (+ (d i) (cont-frac-helper (+ i 1))))))
  (cont-frac-helper 1))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)