#lang sicp

(define (make-segment start end) (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (square x) (* x x))
(define (length s)
  (let ((start (start-segment s))
        (end (end-segment s)))
    (sqrt (+ (square (- (x-point end) (x-point start)))
             (square (- (y-point end) (y-point start)))))))

; First representation is to define the rectangle in terms of two segments, the height and width

(define (make-rectangle-1 left top)
  (cons (length top) (length left)))

; Second representation is to define the rectangle in terms of two points, the bottom-left and top-right

(define (make-rectangle-2 bottom-left top-right)
  (define top-left (make-point (x-point bottom-left) (y-point top-right)))
  (let ((s1 (make-segment bottom-left top-left))
        (s2 (make-segment top-left top-right)))
    (cons (length s2) (length s1))))

; ----------------------------------------------------------------------- ;

(define (width rect) (car rect))
(define (height rect) (cdr rect))

(define (perimeter rect)
  (/ (+ (width rect) (height rect)) 2.0))
(define (area rect)
  (* (width rect) (height rect)))