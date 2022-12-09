




(define (equalTo? x y)
  (cond ( (not(pair? x)) (eq? x y) )
        ( (not(pair? y)) (eq? x y) )
        (else (cond ((equalTo? (car x) (car y)) (equalTo? (cdr x) (cdr y)) )
                    (else (equalTo? (car x) (car y)) ) ) )
        )
)

;;(define (equalFns? fn1 fn2 domain)
  ;;(equalTo? (map fn1 domain) (map fn2 domain) )
  ;;)

(define (same-vals fn1 fn2 domain)
  (cond ( (not(pair? domain)) '() )
        ( (equalTo? (car (map fn1 domain)) (car (map fn2 domain)) )
          (cons (car domain) (same-vals fn1 fn2 (cdr domain)) ) )
        (else (same-vals fn1 fn2 (cdr domain)) ) )
  )


;;﻿(same-vals (lambda (x) x) (lambda (y) (abs y)) '(-3 -2 -1 0 1 2 3))
;;(same-vals (lambda (x) (* x 2)) (lambda (y) (+ y 2)) '(-3 -2 -1 0 1 2 3))