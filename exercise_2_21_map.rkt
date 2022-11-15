#lang sicp

(define (square x) (* x x))

(define (square-list items)
  (map square items))

(square-list (list 1 2 3 4 5 6))