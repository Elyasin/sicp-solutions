#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound x) (min (cdr x) (car x)))

(define (upper-bound x) (max (cdr x) (car x)))


(lower-bound (make-interval 1 3))
(upper-bound (make-interval 1 3))

(lower-bound (make-interval 3 1))
(upper-bound (make-interval 3 1))
