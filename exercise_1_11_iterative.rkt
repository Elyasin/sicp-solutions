#lang sicp

(define (f n) 
  (f-iter 0 1 2 n))

(define (f-iter a b c count)
  (if (= count 0)
      a 
      (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

(f 5)