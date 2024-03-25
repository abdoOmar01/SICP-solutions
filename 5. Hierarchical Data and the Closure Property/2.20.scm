#lang sicp

(define (same? x y)
  (or (and (even? x) (even? y))
      (and (odd? x) (odd? y))))

(define (reverse items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (car items) result))))
  (iter items (list)))

(define (same-parity i . r)
  (define (iter items result)
    (if (null? items)
        (reverse result)
        (iter (cdr items)
              (if (same? i (car items))
                  (cons (car items) result)
                  result))))
  (iter r (list i)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)