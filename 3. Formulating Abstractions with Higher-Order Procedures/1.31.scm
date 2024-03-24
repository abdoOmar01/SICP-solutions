#lang sicp

;; a.

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
  (product identity 1 inc n))

(define (pi n)
  (define (pi-term x)
    (/ (* x (+ x 2.0)) (* (+ x 1.0) (+ x 1.0))))
  (define (pi-next x) (+ x 2.0))
  (* (product pi-term 2 pi-next n) 4.0))

;; b.

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))