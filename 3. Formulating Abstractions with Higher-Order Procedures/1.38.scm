#lang sicp

(define (cont-frac n d k)
  (define (helper count)
    (if (> count k)
        0
        (/ (n k) (+ (d k) (helper (+ count 1))))))
  (helper 1))

(define (e k)
  (define (d i)
    (if (= (remainder i 3) 2)
        (/ (* (+ i 1) 2) 3)
        1))
  (+ 2.0 (cont-frac (lambda (x) 1) d k)))