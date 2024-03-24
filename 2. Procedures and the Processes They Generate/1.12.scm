#lang sicp

(define (pascal row col)
  (cond ((or (< row 0) (< col 0) (> col row))
         (error "Rows and columns must be positive integers, and columns must be no greater than rows\n"))
        ((or (= col 0) (= col row)) 1)
        (else (+ (pascal (- row 1) col) (pascal (- row 1) (- col 1))))))