#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound x) (min (cdr x) (car x)))

(define (upper-bound x) (max (cdr x) (car x)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(sub-interval (make-interval 1 10) (make-interval 2 11))