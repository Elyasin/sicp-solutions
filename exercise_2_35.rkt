#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves tree)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree tree))))



(define tree (cons (list 1 2) (list 3 4)))
(count-leaves (list tree))
(count-leaves (list tree tree))
