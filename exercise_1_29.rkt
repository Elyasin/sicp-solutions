#lang sicp

(define (cube x)
  (* x x x))

(define (even? n) (= (remainder n 2) 0))

(define (inc x) (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (simpson-integration f a b n)
  (define h (/ (- b a) n))

  (define (y k)
    (cond ((or (= k 0) (= k n)) (f (+ a (* k h))))
          ((even? k)    (* 2 (f (+ a (* k h)))))
          ( else        (* 4 (f (+ a (* k h)))))))

  (* (/ h 3) (sum y a inc n)))

(simpson-integration cube 0 1 100)
(simpson-integration cube 0 1 1000)