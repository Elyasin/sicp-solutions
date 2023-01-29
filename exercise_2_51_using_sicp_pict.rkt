#lang sicp

(#%require sicp-pict)

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-left
           (transform-painter
            painter1
            (make-vect 0.0 0.0)
            (make-vect 1.0 0.0)
            split-point))
          (paint-right
           (transform-painter
            painter2
            split-point
            (make-vect 1.0 0.5)
            (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below2 painter1 painter2)
  (rotate270 (beside (rotate90 painter1) (rotate90 painter2))))

(paint (below einstein einstein))

(paint (below2 einstein einstein))