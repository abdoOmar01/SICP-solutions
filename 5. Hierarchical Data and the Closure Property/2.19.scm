#lang sicp

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount (except-first-denomination coin-values))
                 (cc (- amount (first-denomination coin-values)) coin-values)))))

(define (no-more? items) (null? items))
(define (first-denomination items) (car items))
(define (except-first-denomination items) (cdr items))

; The order of coins does not affect the answer, as the procedure will compute all combinations.
; The order does affect the speed, though.