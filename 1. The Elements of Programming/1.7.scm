#lang sicp

(define (square n) (* n n))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess prev-guess x)
   (and (not (= prev-guess 0))
        (< (abs (- (square guess) x)) 0.001)
        (< (abs (- guess prev-guess)) 0.0001)))
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess x)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(sqrt 0.0001)