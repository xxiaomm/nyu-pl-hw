
;; (equalTo? x y) returns a boolean value, which is the result of x == y.
;; Base case: if x  or y is empty list or not a list, return (eq? x y).
;; Hypothesis: Assume (equalTo? x y) returns each atoms' result in the list of (car x) == (car y)
;; Recursive step: (equalTo? x y) returns (cond ((equalTo? (car x) (car y))
;;                                                         (equalTo? (cdr x) (cdr y)) )
;;                                        (else (equalTo? (car x) (car y)) ) )

(define (equalTo? x y)
  (cond ( (not(pair? x)) (eq? x y) )
        ( (not(pair? y)) (eq? x y) )
        (else (cond ((equalTo? (car x) (car y)) (equalTo? (cdr x) (cdr y)) )
                    (else (equalTo? (car x) (car y)) ) ) )
        )
)

;; ((eq? (car x) (car y)))
;;(equalTo? 3 3)
;;(equalTo? 3 'b)
;;(equalTo? 'hh 'bb)
;;(equalTo? 'ads 'ads)
;;(equalTo? 'ads '(1 2))
;;(equalTo? '() '())
;;(equalTo? '(2 5 4 'aa) '(2 3 4 'aa))
;;(equalTo? '(2 5 4 'aa) '((2) 3 4 'aa))
;;(equalTo? '((2) 3 4 'aa) '((2) 3 4 'aa))
;;(equalTo? '(2 ( 3 4 ('aa) ) ) '(2 ( 3 4 ('aa) ) ) )