#lang sicp

(define (square a) (* a a))

(define (divides? a b) (= (remainder b a) 0))

(define (even? n) (= (remainder n 2) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n) (= n (smallest-divisor n)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
  
(define (search-for-primes a b)
  (cond ((even? a) (search-for-primes (+ a 1) b))
        ((< a b) (timed-prime-test a)
                 (search-for-primes (+ a 2) b))))

(newline)
(display "First three prime numbers > 1000")
(search-for-primes 1000 1020)

(newline)
(display "First three prime numbers > 10000")
(search-for-primes 10000 10039)

(newline)
(display "First three prime numbers > 100000")
(search-for-primes 100000 100045)

(newline)
(display "First three prime numbers > 1000000")
(search-for-primes 1000000 1000039)
