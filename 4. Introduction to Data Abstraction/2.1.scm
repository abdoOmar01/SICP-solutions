#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((n (if (< d 0) (- n) n))
        (d (abs d))
        (g (abs (gcd n d))))
    (cons (/ n g) (/ d g))))