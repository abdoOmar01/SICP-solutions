#lang sicp

(define (square n) (* n n))
(define (divides? a b) (= (remainder b a) 0))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (define (next i) (if (= i 2) 3 (+ i 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (prime? n) (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime))
  (newline))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Avg. time: 1ms
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)

; Avg. time: 1ms
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)

; Avg. time: 4ms
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)

; Avg. time: 11ms
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)