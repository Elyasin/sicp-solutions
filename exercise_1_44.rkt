#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1) f
      (compose f (repeated f (- n 1)))))

(define dx 0.00001)

(define (smooth f)
  (define (average x) (/ (+ (f (- x dx)) (f x)  (f (+ x dx))) 3))
  (lambda (x) (average x)))

(define (smooth-n f n)
  ((repeated smooth n) f))

; maybe not the best example
; just to show how to call the procedure
(sin 1)
((smooth-n sin 10) 1)