#lang sicp

(define (last-pair items)
  (if (null? (cdr items)) (car items)
      (last-pair (cdr items))))

(last-pair (list 1 2 3 4 5 6))
(last-pair (list (cons 1 2) (cons 3 4) (cons 5 6)))
(last-pair (list 1))
(last-pair (list '()))