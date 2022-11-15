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

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y))
        )
    (cond ((and (<  x1 0) (<  x2 0) (<  y1 0) (<  y2 0)) 
           (make-interval (* x2 y2) (* x1 y1)))
          ((and (<  x1 0) (>= x2 0) (<  y1 0) (<  y2 0)) 
           (make-interval (* x2 y1) (* x1 y1)))
          ((and (>= x1 0) (>= x2 0) (<  y1 0) (<  y2 0)) 
           (make-interval (* x2 y1) (* x1 y2)))
          ((and (<  x1 0) (<  x2 0) (<  y1 0) (>= y2 0)) 
           (make-interval (* x1 y2) (* x1 y1)))
          ((and (<  x1 0) (<  x2 0) (>= y1 0) (>= y2 0)) 
           (make-interval (* x1 y2) (* x2 y1)))
          ((and (<  x1 0) (>= x2 0) (<  y1 0) (>= y2 0)) 
           (make-interval (min (* x1 y2) (* x2 y1)) (max (* x1 y1) (* x2 y2))))
          ((and (<  x1 0) (>= x2 0) (>= y1 0) (>= y2 0)) 
           (make-interval (* x1 y2) (* x2 y2)))
          ((and (>= x1 0) (>= x2 0) (<  y1 0) (>= y2 0)) 
           (make-interval (* x2 y1) (* x2 y2)))
          ((and (>= x1 0) (>= x2 0) (>= y1 0) (>= y2 0)) 
           (make-interval (* x1 y1) (* x2 y2)))
          (else (error "must never be displayed " x1 x2 y1 y2)))))

(define (div-interval x y)
  (cond ((and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
         (error "Interval spans 0. Illegal division: " (lower-bound y) (upper-bound y)))
        (else (mul-interval x (make-interval (/ 1 (upper-bound y)) (/ 1 (lower-bound y)))))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one 
                  (add-interval (div-interval one r1) 
                                (div-interval one r2)))))


(define one (make-interval 1 1))

; no neutral element for / in interval arithmetic
(par1 (make-center-percent 5 .01) one)
(par2 (make-center-percent 5 .01) one)

; the parallel resistors formulas are not equivalent
(par1 (make-center-percent 5 .01) (make-center-percent  5 .01))
(par2 (make-center-percent 5 .01) (make-center-percent  5 .01))



(make-center-percent 10 .01)
; (9.9 . 10.1)

(mul-interval (div-interval (make-center-percent 10 .01) (make-center-percent 10 .01)) (make-center-percent 10 .01))
; (9.70396039603961 . 10.3040404040404)
