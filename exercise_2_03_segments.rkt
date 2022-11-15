#lang sicp

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (x-dist segment) 
    (abs (- (x-point (end-segment   segment)) 
            (x-point (start-segment segment)))))

(define (y-dist segment) 
    (abs (- (y-point (end-segment   segment)) 
            (y-point (start-segment segment)))))

; constructor for height/width of rectangle - changed
(define (make-rect height-segment width-segment) 
    (cons height-segment width-segment))

; selectors - changed
(define (height-segment rectangle) (car rectangle))
(define (width-segment  rectangle) (cdr rectangle))

; abstraction barrier - changed
(define (height rectangle) (y-dist (height-segment rectangle)))
(define (width  rectangle) (x-dist (width-segment  rectangle)))

; higher abstraction barrier - same as before
(define (perimeter r) (+ (* (height r) 2) (* (width r) 2)))
(define (area r) (* (height r) (width r)))