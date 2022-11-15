#lang sicp

(define (even? n) (= (remainder n 2) 0))
(define (div3? n) (= (remainder n 3) 0))

(define (square x) (* x x))

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter a (square b) (/ n 2)))
          (else      (fast-expt-iter (* a b) b (- n 1)))))
  (fast-expt-iter 1 b n))

(define (cons a b)
  (* (fast-expt 2 a) (fast-expt 3 b)))

(define (car n)
  (define (iter count n)
    (if (even? n)
        (iter (+ count 1) (/ n 2)) count))
  (iter 0 n))

(define (cdr n)
  (define (iter count n)
    (if (div3? n) (iter (+ count 1) (/ n 3)) count))
  (iter 0 n))

(cons 3 3)
(car (cons 3 3))
(cdr (cons 3 3))