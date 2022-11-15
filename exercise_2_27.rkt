#lang sicp

(define (deep-reverse items)
  (cond ((pair? items) (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))
        (else items)))

(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)
