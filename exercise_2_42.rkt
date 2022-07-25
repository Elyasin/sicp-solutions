#lang racket

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (queens board-size)

  ; add new position to the head of list
  (define (adjoin-position new-row k rest-of-queens)
    (cons (list new-row k) rest-of-queens))

  (define empty-board '())

  (define (safe? k positions)
    
    (define (check pos positions)
      (cond
        ; all good, nothing found
        ((null? positions) #t)
        ; if same row or same column then unsafe
        ((or (= (car pos) (car (car positions))) (= (cadr pos) (cadr (car positions)))) #f)
        ; if diagonally reachable then unsafe
        ((= (abs (- (car pos) (car (car positions)))) (abs (- (cadr pos) (cadr (car positions))))) #f)
        ; else check remaining positions
        (else (check pos (cdr positions)))))

    ; queen in column k is first item; see adjoin-position
    (let ((k-col-queen-pos (car positions)))
      (check k-col-queen-pos (cdr positions))))

  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  
  (queen-cols board-size))

(queens 8)
