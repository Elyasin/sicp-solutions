#lang sicp

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

(define (unique-triples n)
  (flatmap (lambda (i) 
             (flatmap (lambda (j) 
                        (map (lambda (k) (list i j k)) 
                             (enumerate-interval 1 n))) 
                      (enumerate-interval 1 n)))
           (enumerate-interval 1 n)))

(define (ordered-triple? triple)
  (and (< (car triple) (cadr triple)) 
       (< (cadr triple) (caddr triple))))

(define (ordered-unique-triples n)
  (filter ordered-triple? (unique-triples n)))

(define (triples-sum? n)
  (lambda (triple) (= n (+ (car triple) 
                           (cadr triple) 
                           (caddr triple)))))

(define (triples-sum triples n)
  (filter (triples-sum? n) triples))




(triples-sum (unique-triples 6) 6)

