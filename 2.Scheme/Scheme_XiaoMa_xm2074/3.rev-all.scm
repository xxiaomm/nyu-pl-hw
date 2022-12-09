;; (compress L) returns the list of all the atoms(non-list values) contained in L.
;; Base case: if L is empty list or not a list, return an empty list.
;; Hypothesis: Assume (compress L) returns the list of the atoms of (car L) and (cdr L).
;; Recursive step: (compress L) returns (append (cond ( (list? (car L))  (compress (car L)) )
;;                                              (else (list(car L))) )
;;                                              (compress (cdr L)) )



;;(define (rev old new)
  ;;(cond ((null? old) new)
    ;;    (else (rev (cdr old) (cons (car old) new)) )  
;;    )
  ;;)
;;9 lines

(define (rev old new)
  (cond ((null? old) new)
        (else (cond ( (not(list? (car old)))  (rev (cdr old) (cons (car old) new)) )
                    (else (rev (cdr old)
                               (cons (rev (car old) '()) new)) ) )
          )  
    )
  )
(define (rev-all L)
  (rev L '())
  )

;;﻿ (rev-all '(1 2 (3 4) (5 6 (7 8) 9) 10))