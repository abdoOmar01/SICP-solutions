#lang sicp

(define (square x) (* x x))
(define (sum-largest x y z)
  (cond ((and (<= x y) (<= x z)) (+ (square y) (square z)))
        ((and (<= y x) (<= y z)) (+ (square x) (square z)))
        (else (+ (square x) (square y)))))