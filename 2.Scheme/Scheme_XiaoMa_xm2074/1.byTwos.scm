;; (byTwos n m) returns the list of every other integer starting with n up to m.
;; Base Case: if n > m, the result is the empty list.
;; Hypothesis: Assume (byTwos (+ n 2) m) returns the list of every other integer
;; from n+2 up to m.
;; Recursive step: (byTwos n m) returns (cons n (byTwos (+ n 2) m))
(define (byTwos n m)
    (cond ((> n m ) (list))
    (else (cons n (byTwos (+ 2 n) m)))))
