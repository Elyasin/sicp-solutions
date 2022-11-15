#lang sicp

(define (gcd a b)
  (if (= b 0) a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    ; abs is the absolute function
    (let ((g (abs g)))
      (cond ((< d 0) (cons (/ (- n) g) (/ (- d) g)))
            (else    (cons (/ n g) (/ d g)))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -30 -36))
(print-rat (make-rat 30 -36))
(print-rat (make-rat -30 36))
(print-rat (make-rat 30 36))