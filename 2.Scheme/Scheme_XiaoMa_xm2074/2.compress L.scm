;; (compress L) returns the list of all the atoms(non-list values) contained in L.
;; Base case: if L is empty list or not a list, return an empty list.
;; Hypothesis: Assume (compress L) returns the list of the atoms of (car L) and (cdr L).
;; Recursive step: (compress L) returns (append (cond ( (list? (car L))  (compress (car L)) )
;;                                              (else (list(car L))) )
;;                                              (compress (cdr L)) )

(define (compress L)
  (cond ( (not(pair? L)) (list) )
  (else (append (cond ( (list? (car L))  (compress (car L)) )
                      (else (list(car L))) )
                (compress (cdr L)) )
        ) 
   )
)

;;(compress '(1 (2 3 (4 5) (6 7 (8)) 9) 10))
;;(compress '(((11) (2 3)) 6 7))