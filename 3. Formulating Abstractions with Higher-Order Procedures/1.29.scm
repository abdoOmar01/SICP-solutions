#lang sicp

(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (term k)
    (cond ((or (= k 0) (= k n)) (y k))
          ((odd? k) (* 4.0 (y k)))
          (else (* 2.0 (y k)))))
  (* (/ h 3) (sum term 0 inc n)))

(define (integral f a b dx)
  (define (term x) (f (+ x (/ dx 2.0))))
  (define (next x) (+ x dx))
  (* (sum term a next b) dx))


(simpson cube 0 1 100)    ; 0.24999999999999992
(simpson cube 0 1 1000)   ; 0.2500000000000002

(integral cube 0 1 0.01)  ; 0.24998750000000042
(integral cube 0 1 0.001) ; 0.24999987500000095