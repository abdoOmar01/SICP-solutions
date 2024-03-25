#lang sicp

(define (square x) (* x x))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (count-divisions n d)
  (define (iter count n)
    (if (= (remainder n d) 0)
        (iter (+ count 1) (/ n d))
        (- count 1)))
  (iter 1 n))

(define (cons a b) (* (fast-expt 2 a) (fast-expt 3 b)))
(define (car pair) (count-divisions pair 2))
(define (cdr pair) (count-divisions pair 3))