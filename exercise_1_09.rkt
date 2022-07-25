#lang sicp

; use plus intead of + and minus instead of -
(define (plus a b)
  (if (= a 0) b (inc (plus (dec a) b))))
(define (minus a b)
  (if (= a 0) b (plus (dec a) (inc b))))

(plus 4 5)