#lang sicp

(define (square x) (* x x))
(define (cube x) (* x x x))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (good-enough? guess prev-guess x)
   (and (not (= prev-guess 0))
        (< (abs (- (cube guess) x)) 0.001)
        (< (abs (- guess prev-guess)) 0.0001)))
(define (cbrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess x)
      guess
      (cbrt-iter (improve guess x) guess x)))
(define (cbrt x)
  (cbrt-iter 1.0 0 x))

(cbrt 27)
(cbrt 0.00001)
(cbrt 36277783234)