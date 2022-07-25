#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
      (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs) 
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w) (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v) 
  (map (lambda (c) (dot-product v c)) m))

(define (transpose mat) (accumulate-n cons '() mat))

(define (matrix-*-matrix m n) 
  (let ((n_T (transpose n))) 
    (map (lambda (row) (matrix-*-vector n_T row)) m)))

(display(dot-product (list 1 2 3) (list 1 2 3)))
(newline)
(display (matrix-*-vector (list (list 1 2 3) (list 1 2 3) (list 1 2 3)) (list 1 2 3)))
(newline)
(display (transpose (list (list 1 2 3) (list 1 2 3) (list 1 2 3))))
(newline)
(display (matrix-*-matrix (list (list 1 2 3) (list 1 2 3) (list 1 2 3)) (list (list 1 2 3) (list 1 2 3) (list 1 2 3))))
(newline)