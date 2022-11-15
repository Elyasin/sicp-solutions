#lang sicp

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (average a b) (/ (+ a b) 2))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (midpoint-segment segment)
  (make-point (average (x-point (end-segment segment)) (x-point (start-segment segment))) 
              (average (y-point (end-segment segment)) (y-point (start-segment segment)))))

(define start-point (make-point 1 1))
(define end-point (make-point 9 9))
(define seg (make-segment start-point end-point))

(print-point start-point)
(print-point end-point)
(print-point (midpoint-segment seg))