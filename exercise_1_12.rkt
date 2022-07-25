#lang sicp

(define (f row col)
  (cond
    ((= col 1) 1)
    ((= row col) 1)
    (else (+ (f (- row 1) (- col 1)) (f (- row 1) col)))))

(f 1 1)
(f 3 2)
(f 5 3)