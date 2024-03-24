#lang sicp

(define (square x) (* x x))
(define (tan-cf x k)
  (define (n i) (if (= i 1) x (square x)))
  (define (d i) (- (* i 2.0) 1))
  (define (iter count)
    (if (> count k)
        0
        (/ (n count) (- (d count) (iter (+ count 1))))))
  (iter 1))