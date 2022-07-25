#lang sicp

(define (square x) (* x x))

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter a (square b) (/ n 2)))
          (else      (fast-expt-iter (* a b) b (- n 1)))))
  (fast-expt-iter 1 b n))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next) next (try next))))
  (try first-guess))

(define (average a b) (/ (+ a b) 2))

(define (average-damp f) (lambda (x) (average x (f x))))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1) f
      (compose f (repeated f (- n 1)))))

(define (nth-root x n)
  (define (shift-right n count)
    (if (= n 0) count
        (shift-right (quotient n 2) (+ count 1))))
  (if (= n 0) x
      (fixed-point
       ((repeated average-damp (shift-right n 0))
        (lambda (y) (/ x (fast-expt y (- n 1)))))
       1.0)))

(nth-root 2 0)
(nth-root 2 1)
(nth-root 4 2)
(nth-root 8 3)
(nth-root 16 4)
(nth-root 32 5)
(nth-root 64 6)
(nth-root 128 7)
(nth-root 256 8)
(nth-root 512 9)
(nth-root 1024 10)
(nth-root 2048 11)
(nth-root 4096 12)
(nth-root 8192 13)