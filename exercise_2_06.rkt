#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define three (lambda (f) (lambda (x) (f (f (f x))))))

(define (plus a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))

; successor function simply adds 1 to n
(define (succ n) (+ n 1))

; apply succ zero times to 5
((zero succ) 5)

; apply succ one time
((one succ) 5)

; apply succ twice
((two succ) 5)

; apply succ three times
((three succ) 5)

; apply succ three plus one times
(((add-1 three) succ) 5)

; apply succ two plus three times
(((plus two three) succ) 5)
