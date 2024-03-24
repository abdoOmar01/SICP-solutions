#lang sicp

(define (square n) (* n n))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (carmichael n)
  (define (test a)
    (cond ((>= a n) #t)
          ((= (expmod a n n) a) (test (+ a 1)))
          (else #f)))
  (test 1))

(carmichael 561)
(carmichael 1105)
(carmichael 1729)
(carmichael 2465)
(carmichael 2821)
(carmichael 6601)