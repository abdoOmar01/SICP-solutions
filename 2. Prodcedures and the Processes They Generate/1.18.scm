#lang sicp

(define (double n) (* n 2))
(define (halve n) (/ n 2))
(define (fast-mul-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (fast-mul-iter (double a) (halve b) n))
        (else (fast-mul-iter a (- b 1) (+ a n)))))
(define (fast-mul a b)
  (fast-mul-iter a b 0))