#lang sicp

(define (filtered-accumulate predicate combiner null-value term a next b)
  (define (filter predicate term a)
    (if (predicate a) (term a)
        null-value))
  (if (> a b)
      null-value
      (combiner (filter predicate term a) 
                (filtered-accumulate predicate combiner null-value term (next a) next b))))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n) ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n)
  (and (= n (smallest-divisor n)) (> n 1)))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-of-squares-of-primes 1 10) ; 4 + 9 + 25 + 49
(sum-of-squares-of-primes 10 20) ; 121 + 169 + 289 + 361