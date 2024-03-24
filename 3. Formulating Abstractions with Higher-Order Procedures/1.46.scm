#lang sicp

(define tolerance 0.00001)

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2.0))

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (x) (iter x)))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f)
  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) 1.0))