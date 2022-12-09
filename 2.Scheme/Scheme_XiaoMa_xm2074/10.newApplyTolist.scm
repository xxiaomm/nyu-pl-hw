

(define (newApplyToList f)
  (lambda (L) (if (null? L) '()
                           (cons (f (car L))  ((newApplyToList f) (cdr L)))  )       
   ) 
)


;;﻿(define g (newapplyToList (lambda (x) (* x 2))))
;;﻿(g '(1 2 3 4 5))
;;﻿((newApplyToList (lambda (y) (car y))) '((1 2 3) (4 5 6) (7 8 9)))

;;(define (myMap f L)
  ;;(cond ((null? L) '())
    ;;    (else (cons (f (car L))  (myMap f (cdr L))))))



(letrec ((fac (lambda (x) (if (= x 0) 1 (* x (fac (- x 1))))) )
         )
  (fac 5))

;;(letrec ((f (lambda (x) (if (= x 0) 1 (* x (g (- x 1))))))
  ;;         (g (lambda (x) (if (= x 0) 1 (* x (f (- x 1)))))))
    ;;  (f 5))