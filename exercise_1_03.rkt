#lang sicp

(define (sum-of-squares-of-3 a b c)
  (if (> a b) 
      (if (> b c) 
          (+ (* a a) (* b b)) 
          (+ (* a a) (* c c)))
      (if (> a c) 
          (+ (* b b) (* a a)) 
          (+ (* b b) (* c c)))))

(sum-of-squares-of-3 1 2 3)
(sum-of-squares-of-3 4 3 2)
(sum-of-squares-of-3 5 3 4)
