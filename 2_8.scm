(define reversedeci
  (lambda (l sum n)
    (cond ((null? l) sum)
          ((reversedeci (cdr l) (+ (* (expt 10 n) (car l)) sum) (+ n 1))))))

(define todeci
  (lambda (l sum n)
    (cond ((null? l) sum)
          ((todeci (cdr l) (+ (* 10 sum) (car l)) (+ n 1))))))

(define tolist
  (lambda (n l)
    (cond ((> 10 n) (cons n l))
          ((tolist (quotient n 10) (cons (modulo n 10) l))))))


(display (reversedeci '(8 7 3) 0 0))
(newline)

(display (+ (reversedeci '(8 7 3) 0 0) (reversedeci '(4 5 6) 0 0)))
(newline)

(display (reverse (tolist (+ (reversedeci '(8 7 3) 0 0) (reversedeci '(4 5 6) 0 0)) '())))
(newline)

(display (tolist (+ (todeci '(1 2 3) 0 0) (todeci '(4 5 6) 0 0)) '()))
(newline)
