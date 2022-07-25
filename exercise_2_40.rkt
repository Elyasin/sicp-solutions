#lang sicp

(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))

(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n) (= n (smallest-divisor n)))

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
      (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence) 
  (cond ((null? sequence) '())
        ((predicate (car sequence)) (cons (car sequence) 
                                    (filter predicate (cdr sequence)))) 
        (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j)) 
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (prime-sum-pairs n) 
  (map make-pair-sum 
       (filter prime-sum? (unique-pairs n))))

(display (prime-sum-pairs 6))
(newline)
