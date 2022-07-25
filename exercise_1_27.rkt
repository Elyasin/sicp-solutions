#lang sicp

(define (square a) (* a a))

(define (even? n) (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (carmichael n)
  (carmichael-helper n (- n 1)))

(define (carmichael-helper n a)
  (cond ((= a 1) (display "is prime")(newline))
        ((= a (expmod a n n)) (carmichael-helper n (- a 1)))
        (else (display "is not prime")(newline))))

(carmichael 561)
(carmichael 1105)
(carmichael 1729)
(carmichael 2465)
(carmichael 2821)
(carmichael 6601)