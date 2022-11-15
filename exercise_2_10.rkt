#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound x) (min (cdr x) (car x)))

(define (upper-bound x) (max (cdr x) (car x)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (cond ((and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
         (error "Interval spans 0. Illegal division: " (lower-bound y) (upper-bound y)))
        (else (mul-interval x (make-interval (/ 1 (upper-bound y)) (/ 1 (lower-bound y)))))))

(div-interval (make-interval 1 2) (make-interval 3 4))
(div-interval (make-interval 1 2) (make-interval -1 1))
