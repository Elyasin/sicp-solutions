#lang sicp

(define (even? n) (= (remainder n 2) 0))

(define (double n) (* 2 n))

(define (halve n) (/ n 2))

(define (fast-mult a b)
  (define (fast-mult-iter a b c)
    (cond ((= a 1) (+ b c))
          ((even? a) (fast-mult-iter (halve a) (double b) c ))
          (else (fast-mult-iter (- a 1) b (+ b c) ))))
  (cond ((= a 0) 0)
        ((= b 0) 0)
        (else (fast-mult-iter a b 0))))

(fast-mult 9 9)