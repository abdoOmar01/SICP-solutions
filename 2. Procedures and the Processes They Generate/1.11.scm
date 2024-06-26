#lang sicp

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f-iter n)
  (define (f-helper count a b c)
    (if (= count 0)
        c
        (f-helper (- count 1)
                  (+ a (* 2 b) (* 3 c))
                  a
                  b)))
  (f-helper n 2 1 0))