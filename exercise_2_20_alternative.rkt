#lang sicp

(define (reverse items)
  (if (null? (cdr items)) 
      items
      (append (reverse (cdr items)) (list (car items)))))

(define (same-parity a . b)
  (define (even? x) (= (remainder x 2) 0))
  (define (parity x) (equal? (even? x) (even? a)))
  (define (same-parity-helper process_list result_list)
    (if (null? process_list) 
        result_list
        (if (parity (car process_list)) 
            (same-parity-helper (cdr process_list) (cons (car process_list) result_list)) 
            (same-parity-helper (cdr process_list) result_list))))
  (reverse (same-parity-helper b (list a))))

(same-parity 1 2 3 4 5 6 7 8)
(same-parity 2 1 3 4 5 6 7 8)