#lang sicp

(define (filtered-accumulate predicate combiner null-value term a next b)
  (define (filter predicate term a)
    (if (predicate a) (term a)
        null-value))
  (if (> a b)
      null-value
      (combiner (filter predicate term a) 
                (filtered-accumulate predicate combiner null-value term (next a) next b))))

(define (gcd a b)
  (if (= b 0) a
      (gcd b (remainder a b))))

(define (relative-prime? n i)
  (= 1 (gcd i n)))

(define (product-relatively-prime a b)
  (define (rel-prime-filter-to-b x)
    (relative-prime? b x))
  (filtered-accumulate rel-prime-filter-to-b * 1 identity a inc b))

(define (product-relatively-prime-to n)
  (product-relatively-prime 1 n))

(product-relatively-prime-to 5) ; 1 * 2 * 3 * 4
(product-relatively-prime-to 10) ; 1 * 3 * 7 * 9