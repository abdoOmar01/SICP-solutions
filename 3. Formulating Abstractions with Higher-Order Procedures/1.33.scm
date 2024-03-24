#lang sicp

(define (filtered-accumulate predicate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (predicate a) (term a) null-value)
                (filtered-accumulate predicate combiner null-value term (next a) next b))))


;; a.

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= (smallest-divisor n) n))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (sum-squares-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))


;; b.

(define (identity x) x)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relative-prime? i n)
  (= (gcd i n) 1))

(define (product-relative-prime n)
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))