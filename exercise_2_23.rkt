#lang sicp

(define (for-each f ll)
  (if (null? ll)
      #t
      (and (f (car ll)) (for-each f (cdr ll)))))


(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))