#lang sicp

(define (make-vect x y) (list x y))

(define (make-segment start end) (list start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cadr segment))

(define seg (make-segment (make-vect 0 2) (make-vect 2 0)))
(start-segment seg)
(end-segment seg)
