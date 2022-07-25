#lang sicp

(define (square a) (* a a))

(define (even? n) (= (remainder n 2) 0))

(define (nontrivial-sqrt-test f m)
    (if (and (> f 1) (< f (- m 1)) (= 1 (remainder (square f) m)))
        0
        (remainder (square f) m)))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp) (nontrivial-sqrt-test (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
    (define (try-it a)
        (= (expmod a (- n 1) n) 1))
    (try-it (+ 2 (random (- n 3))))) ; 2 <= a <= n-2

(define (fast-prime? n times)
    (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))

; Carmicheal numbers
(fast-prime? 561 4)
(fast-prime? 1105 4)
(fast-prime? 1729 4)
(fast-prime? 2465 4)
(fast-prime? 2821 4)
(fast-prime? 6601 4)

; prime numbers
(fast-prime? 10000079 4)
(fast-prime? 10000103 4)
(fast-prime? 10000121 4)
(fast-prime? 100000007 4)
(fast-prime? 100000037 4)
(fast-prime? 100000039 4)
(fast-prime? 1000000007 4)
(fast-prime? 1000000009 4)
(fast-prime? 1000000021 4)
