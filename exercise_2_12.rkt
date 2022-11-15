#lang sicp

(define (lower-bound x) (min (cdr x) (car x)))

(define (upper-bound x) (max (cdr x) (car x)))

(define (make-interval a b) (cons a b))

(define (center i) (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (if (> p 1) (error "Percentage cannot be greater than 1"))
  (if (< p 0) (error "Percentage cannot be smaller than 0"))
  (make-interval (- c (* c p)) (+ c (* c p))))

(define (percent i) (/ (width i) (center i)))

(define m1 (make-center-percent 5 0.5))
(percent m1)
(center m1)

(define m2 (make-center-percent 5 0.1))
(percent m2)
(center m2)

(define m3 (make-center-percent 5 0.9))
(percent m3)
(center m3)