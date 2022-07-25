#lang sicp

(define (even? n) (= (remainder n 2) 0))

(define (double n) (* 2 n))

(define (halve n) (/ n 2))

(define (fast-mult a b)
  (cond ((= a 0) 0)
        ((= b 0) 0)
        ((= a 1) b)
        ((even? a) (double (fast-mult (halve a) b)))
        (else      (+ b (fast-mult (- a 1) b)))))

(fast-mult 9 9)