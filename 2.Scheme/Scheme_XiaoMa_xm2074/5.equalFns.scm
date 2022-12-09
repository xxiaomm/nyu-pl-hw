
(define (equalTo? x y)
  (cond ( (not(pair? x)) (eq? x y) )
        ( (not(pair? y)) (eq? x y) )
        (else (cond ((equalTo? (car x) (car y)) (equalTo? (cdr x) (cdr y)) )
                    (else (equalTo? (car x) (car y)) ) ) )
        )
)

(define (equalFns? fn1 fn2 domain)
  (equalTo? (map fn1 domain) (map fn2 domain) )
  )