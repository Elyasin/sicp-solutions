#lang sicp

(define (make-vect x y) (list x y))

(define (xcor-vect v) (car v))

(define (ycor-vect v) (cadr v))

(define (add-vect v1 v2) 
  (make-vect (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2) 
  (make-vect (- (xcor-vect v1) (xcor-vect v2)) (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v) (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define v1 (make-vect 1 2))
(define v2 (make-vect 3 4))
(xcor-vect v1)
(ycor-vect v2)
(add-vect v1 v2)
(sub-vect v2 v1)
(scale-vect 3 v1)
