#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) 
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "Trying guess ")
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(fixed-point (lambda (x) (/ (log 1000) (log x))) 10.0)
; 34 steps - without average damping

(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2.0)) 10.0)
; 9 steps - with average damping