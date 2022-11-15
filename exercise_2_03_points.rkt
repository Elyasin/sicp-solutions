#lang sicp

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

; constructor - normalize the rectangle
; p1 is lower left point
; p2 is upper right point
(define (make-rect p1 p2) 
  (cond ((and (< (x-point p1) (x-point p2)) (< (y-point p1) (y-point p2))) 
         (cons p1 p2))
        ((and (< (x-point p1) (x-point p2)) (> (y-point p1) (y-point p2))) 
         (cons (make-point (x-point p1) (y-point p2)) (make-point (x-point p2) (y-point p1))))
        ((and (> (x-point p1) (x-point p2)) (< (y-point p1) (y-point p2))) 
         (cons (make-point (x-point p2) (y-point p1)) (make-point (x-point p1) (y-point p2))))
        (else (cons p2 p1))))

; selectors
(define (point1 rectangle) (car rectangle))
(define (point2 rectangle) (cdr rectangle))

; abstraction barrier
(define (height rectangle) (- (y-point (point2 rectangle)) (y-point (point1 rectangle))))
(define (width  rectangle) (- (x-point (point2 rectangle)) (x-point (point1 rectangle))))

; higher abstraction barrier
(define (perimeter r) (+ (* (height r) 2) (* (width r) 2)))
(define (area r) (* (height r) (width r)))