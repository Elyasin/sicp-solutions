#lang sicp

;; (define (make-mobile left right) (list left right))
(define (make-mobile left right) (cons left right))

;; (define (make-branch length structure) (list length structure))
(define (make-branch length structure) (cons length structure))

;; (define (right-branch mobile) (car (cdr mobile)))
(define (right-branch mobile) (cdr mobile))

;; (define (left-branch mobile) (car mobile))
(define (left-branch mobile) (car mobile))

;; (define (branch-length branch) (car branch))
(define (branch-length branch) (car branch))

;; (define (branch-structure branch) (car (cdr branch)))
(define (branch-structure branch) (cdr branch))


(define (total-weight mobile)
  (cond ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile))) 
                 (total-weight (branch-structure (right-branch mobile)))))))

(define (torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (is-balanced? mobile)
  (cond ((not (pair? mobile)) #t)
        (else
         (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
              (is-balanced? (branch-structure (left-branch mobile)))
              (is-balanced? (branch-structure (right-branch mobile)))))))

;          BM_1
;        /      \
;       W_1      BM_2
;               /    \
;            BM_3     W_2
;           /    \
;         W_3     W_4


(define BRANCH_5 (make-branch 1 5))
(define BRANCH_6 (make-branch 1 5))
(define BM_3 (make-mobile BRANCH_5 BRANCH_6))

(define BRANCH_3 (make-branch 1 BM_3))
(define BRANCH_4 (make-branch 1 5))
(define BM_2 (make-mobile BRANCH_3 BRANCH_4))

(define BRANCH_1 (make-branch 1 5))
(define BRANCH_2 (make-branch 1 BM_2))
(define BM_1 (make-mobile BRANCH_1 BRANCH_2))

(left-branch BM_1)
(right-branch BM_1)
(branch-length (left-branch BM_1))
(branch-length (right-branch BM_1))
(branch-structure (left-branch BM_1))
(branch-structure (right-branch BM_1))

(is-balanced? BM_1)
(is-balanced? BM_3)
