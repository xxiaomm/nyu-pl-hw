

(define (split x L)
  (cond ((pair? L) 
         (cond ((< x (car L)) (cons (car (split x (cdr L)))
                                    (cons (cons (car L) (cadr (split x (cdr L))) ) '()   )
                                    ;;(list (cons (car L) (cdr (split x (cdr L))) )   )
                                    )
                              )
               ((>= x (car L)) (cons (cons (car L) (car (split x (cdr L))) )
                                     (cdr (split x (cdr L)))
                                     )
                               )
               )
         )
        (else '(()())) )
  )


;;(split 4 '(1 5))
;;(split 4 '(1))
;;(split 6 '(1 9 2 8 3 10 4 6 5))
;;(split 4 '(1 5 2))