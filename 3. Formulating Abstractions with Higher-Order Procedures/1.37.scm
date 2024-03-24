#lang sicp

;; a.

(define (cont-frac n d k)
  (define (helper count)
    (if (> count k)
        0
        (/ (n k) (+ (d k) (helper (+ count 1))))))
  (helper 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)


;; b.

(define (cont-frac-iter n d k)
  (define (iter count result)
    (if (= count 0)
        result
        (iter (- count 1) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                11)