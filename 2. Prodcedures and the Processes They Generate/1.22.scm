#lang sicp

(define (square n) (* n n))
(define (divides? a b) (= (remainder b a) 0))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

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

(define (search-for-primes start end)
  (define (iter n m)
    (cond ((< n m) (timed-prime-test n) (iter (+ n 2) m))
          (else (display "Finished prime tests\n"))))
  (iter (if (odd? start) start (+ start 1)) end))

(search-for-primes 1001 1020)       ; (1009, 1013, 1019)           / Avg. time: 1ms
(search-for-primes 10001 10040)     ; (10007, 10009, 10037)        / Avg. time: 2ms 
(search-for-primes 100001 100050)   ; (100003, 100019, 100043)     / Avg. time: 6ms
(search-for-primes 1000001 1000050) ; (1000003, 1000033, 1000037)  / Avg. time: 20ms