;; Question 1:
﻿;; (byTwos n m) returns the list of every other integer starting with n up to m.
;; Base Case: if n > m, the result is the empty list.
;; Hypothesis: Assume (byTwos (+ n 2) m) returns the list of every other integer
;; from n+2 up to m.
;; Recursive step: (byTwos n m) returns (cons n (byTwos (+ n 2) m))

(define (byTwos n m)
    (cond ((> n m ) (list))
    (else (cons n (byTwos (+ 2 n) m)))))



;; Question 2:
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


;; Question 3:
;;(rev-all L) returns a list that reverses all elements of list L
;; even though it has nested lists
;; Base case: if L is an empty list, return '()
;; Hypothesis: Assume (rev-all L) returns list with each atom reversed
;; Recursive step: (rev-all L) returns (cond ( (not(list? (car old)))  (rev (cdr old) (cons (car old) new)) )
;;                                           (else (rev (cdr old)
;;                                                 (cons (rev (car old) '()) new)) ) )

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



;; Question 4:
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

;; Question 5:
;; (equalFns? fn1 fn2 domain) returns a boolean value, which is the result of
;; comparing every atom after dealing with fn1 and fn2 seperately in each list sequencially.
;; Base case: if domain is an empty list, return true.
;; Hypothesis: Assume (equalFns? fn1 fn2 domain) returns each list's result aftering mapping
;; Recursive step: (equalFns? fn1 fn2 domain) returns (equalTo? (map fn1 domain) (map fn2 domain) )
;;

(define (equalFns? fn1 fn2 domain)
  (equalTo? (map fn1 domain) (map fn2 domain) )
 )


;; Question 6:
;; (same-vals fn1 fn2 domain) return the list with atoms of domain such that
;;(fn1 x) and (fn2 x) return the same value.
;; Base case: if the domain is not a list, return '()
;; Hypothesis: Assume (same-vals fn1 fn2 domain) returns list of each first same return value
;; Recursive step: Recursive step:  returns (equalTo? (car (map fn1 domain)) (car (map fn2 domain)) )
;;                                          (cons (car domain) (same-vals fn1 fn2 (cdr domain)) )

(define (same-vals fn1 fn2 domain)
  (cond ( (not(pair? domain)) '() )
        ( (equalTo? (car (map fn1 domain)) (car (map fn2 domain)) )
          (cons (car domain) (same-vals fn1 fn2 (cdr domain)) ) )
        (else (same-vals fn1 fn2 (cdr domain)) ) )
  )

;; Question 7:
;; (split x L) return ﻿a list containing two lists: The first list contains the numbers in L
;;less than or equal to x and the second list contains the numbers in L greater than x.
;; Base case: if L is not a list or an empty list, return '(()())
;; Hypothesis: Assume (split x L) returns list which with each first atom in the correct nested list.
;; Recursive step: (split x L) returns (cond ((< x (car L)) (cons (car (split x (cdr L)))
;;                                              (cons (cons (car L) (cadr (split x (cdr L))) ) '()) )  )
;;                                     ((>= x (car L)) (cons (cons (car L) (car (split x (cdr L))) )
;;                                              (cdr (split x (cdr L))) )  )  )

(define (split x L)
  (cond ((pair? L) 
         (cond ((< x (car L)) (cons (car (split x (cdr L)))
                                    (cons (cons (car L) (cadr (split x (cdr L))) ) '()) )  )
               ((>= x (car L)) (cons (cons (car L) (car (split x (cdr L))) )
                                     (cdr (split x (cdr L))) )  )  )  )
        (else '(()())) )
  )


;; Question 8:
;; (psort L) return ﻿a list with all atoms sorted.
;; Base case: if L is not a list or an empty list, return '()
;; Hypothesis: Assume (psort L) returns each nested list sorted.
;; Recursive step: (psort L) returns (append (psort (car (split (car L) (cdr L))) )
;;                                           (cons (car L)(psort (cadr (split (car L) (cdr L))) ) )
                         
(define (psort L)
  (cond ((pair? L) (append (psort (car (split (car L) (cdr L))) )
                           (cons (car L)(psort (cadr (split (car L) (cdr L))) ) )
                         )
                   )
        (else '())
        )
  )


;; Question 9:
;; (applyToList f) return ﻿a function that takes a list L as a parameter and applies f
;; to every element of L, returning the resulting list as the result. 

(define (applyToList f)
  (lambda (L)(map f L))
 )



;; Question 10:
;; (newApplyToList f) return ﻿a function that takes a list L as a parameter and applies f
;; to every element of L, returning the resulting list as the result. 

(define (newApplyToList f)
  (lambda (L) (if (null? L) '()
                           (cons (f (car L))  ((newApplyToList f) (cdr L)))  )       
   )
 ) 

