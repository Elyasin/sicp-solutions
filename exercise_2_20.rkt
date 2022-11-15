#lang sicp

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (same-parity a . b)
  (define (even? x) (= (remainder x 2) 0))
  (define (parity x) (equal? (even? x) (even? a)))
  (define (same-parity-helper process_list result_list)
    (if (null? process_list) 
        result_list
        (if (parity (car process_list)) 
            (same-parity-helper (cdr process_list) (append result_list (list (car process_list)))) 
            (same-parity-helper (cdr process_list) result_list))))
  (same-parity-helper b (list a)))

(same-parity 1 2 3 4 5 6)
(same-parity 2 3 4 5 6 7)