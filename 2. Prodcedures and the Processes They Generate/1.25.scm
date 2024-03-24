#lang sicp

(define (square n) (* n n))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime))
  (newline))
(define (start-prime-test n start-time)
  (if (fast-prime? n 5) ; The number of times affects the speed
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Avg. time: 350ms
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)

; Avg. time: 20000ms
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)

; Avg. time: 60000ms
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)

; Avg. time: 18000000ms
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)