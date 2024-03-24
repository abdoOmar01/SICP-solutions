#lang sicp

(define dx 0.00001)

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (smooth f)
  (define (average a b c) (/ (+ a b c) 3.0))
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))