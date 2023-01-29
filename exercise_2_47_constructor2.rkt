#lang sicp

(define (make-vect x y) (list x y))

; second constructor definition
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (car (cdr frame)))
(define (edge2-frame frame) (cdr (cdr frame)))

(define origin (make-vect 0 0))
(define edge1 (make-vect 1 0))
(define edge2 (make-vect 0 1))
(define frame (make-frame origin edge1 edge2))
(origin-frame frame)
(edge1-frame frame)
(edge2-frame frame)