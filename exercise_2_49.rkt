#lang sicp

(define (make-vect x y) (list x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cadr v))
(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (ycor-vect v2))))
(define (scale-vect s v) (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define (make-frame origin edge1 edge2) (cons origin (cons edge1 edge2)))
(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (car (cdr frame)))
(define (edge2-frame frame) (cdr (cdr frame)))

(define (make-segment start end) (list start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cadr segment))

(define (for-each f ll)
  (if (null? ll)
      #t
      (and (f (car ll)) (for-each f (cdr ll)))))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))

(define (draw-line start end)
  (display "Drawing line from ")
  (display start)
  (display " to ")
  (display end)
  (newline))

(define outline-painter
  (let ((left-line (make-segment (make-vect 0 0) (make-vect 0 1))))
    (let ((upper-line (make-segment (make-vect 0 1) (make-vect 1 1))))
      (let ((right-line (make-segment (make-vect 1 1) (make-vect 1 0))))
        (let ((lower-line (make-segment (make-vect 1 0) (make-vect 0 0))))
          (segments->painter (list left-line upper-line right-line lower-line)))))))

(define x-painter
  (let ((lower-left-to-upper-right (make-segment (make-vect 0 0) (make-vect 1 1))))
    (let ((lower-right-to-upper-left (make-segment (make-vect 0 1) (make-vect 1 0))))
      (segments->painter (list lower-left-to-upper-right lower-right-to-upper-left)))))

(define diamond-painter
  (let ((lower-to-right (make-segment (make-vect 0.5 0) (make-vect 1 0.5))))
    (let ((right-to-upper (make-segment (make-vect 1 0.5) (make-vect 0.5 1))))
      (let ((upper-to-left (make-segment (make-vect 0.5 1) (make-vect 0 0.5))))
        (let ((left-to-lower (make-segment (make-vect 0 0.5) (make-vect 0.5 0))))
          (segments->painter (list lower-to-right right-to-upper upper-to-left left-to-lower)))))))

(define wave-painter
  (let ((wave (list
               (make-segment (make-vect 0.20 0.00) (make-vect 0.35 0.50))
               (make-segment (make-vect 0.35 0.50) (make-vect 0.30 0.60))
               (make-segment (make-vect 0.30 0.60) (make-vect 0.15 0.45))
               (make-segment (make-vect 0.15 0.45) (make-vect 0.00 0.60))
               (make-segment (make-vect 0.00 0.80) (make-vect 0.15 0.65))
               (make-segment (make-vect 0.15 0.65) (make-vect 0.30 0.70))
               (make-segment (make-vect 0.30 0.70) (make-vect 0.40 0.70))
               (make-segment (make-vect 0.40 0.70) (make-vect 0.35 0.85))
               (make-segment (make-vect 0.35 0.85) (make-vect 0.40 1.00))
               (make-segment (make-vect 0.60 1.00) (make-vect 0.65 0.85))
               (make-segment (make-vect 0.65 0.85) (make-vect 0.60 0.70))
               (make-segment (make-vect 0.60 0.70) (make-vect 0.75 0.70))
               (make-segment (make-vect 0.75 0.70) (make-vect 1.00 0.40))
               (make-segment (make-vect 1.00 0.20) (make-vect 0.60 0.48))
               (make-segment (make-vect 0.60 0.48) (make-vect 0.80 0.00))
               (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.30))
               (make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.00)))))
    (segments->painter wave)))


(outline-painter (make-frame (make-vect 0 0) (make-vect 0 10) (make-vect 10 0)))
(x-painter (make-frame (make-vect 0 0) (make-vect 0 20) (make-vect 20 0)))
(diamond-painter (make-frame (make-vect 0 0) (make-vect 0 5) (make-vect 5 0)))
(wave-painter (make-frame (make-vect 0 0) (make-vect 0 100) (make-vect 100 0)))

